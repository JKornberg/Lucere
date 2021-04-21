import numpy as np
from skimage import data
import skimage
from skimage import io
import math
from model.classes.most_common_color import mostCommonRGBfrom
from model.classes.Result import Result
import threading
import time

from PyQt5.QtCore import QObject, pyqtSignal

class ScanUtility(QObject):
    analysisComplete = pyqtSignal(object)

    def __init__(self):
        super().__init__()

    def threaded(fn):
        def wrapper(*args, **kwargs):
            thread = threading.Thread(target=fn, args=args, kwargs=kwargs)
            thread.start()
            return thread
        return wrapper

    def getDetection(self,image):
        averages = (image[:,:,0].astype('float64') + image[:,:,1].astype('float64') ) /2 #Remove blue channel
        flat = averages.flatten()
        flat = np.ma.masked_equal(flat,0).compressed()
        return np.average(flat)

    def getWavelength(self,image):
        print("Starting Wavelength analysis")
        # Populate dictionary with all wavelenghts and RGB coresponding values
        waveArray = []
        for i in range (510, 610):
            waveArray.append(self.nmToRGB(i))
        waveArray = np.array(waveArray)
        # Get RGB from image
        RGB = mostCommonRGBfrom(image)
        wl =  self.rgbToNm(RGB[0], RGB[1], RGB[2], waveArray)
        return wl

    @threaded
    def analyze(self, trial_id, path):
        # Delay
        print("Sleeping for 3 seconds")
        time.sleep(3)

        image = io.imread('model/classes/' + path)
        value = self.getDetection(image)
        detected = value > 5 #Replace with threshhold based on data
        wavelength = self.getWavelength(image)
        print("Emitting signal...")
        self.analysisComplete.emit((trial_id, Result(detected, wavelength, value)))

    def nmToRGB(self,wavelength):
        gamma = 0.80
        intensityMax = 255
        factor = 0
        red = 0
        green = 0
        blue = 0

        if(wavelength >= 380 and wavelength<440):
            red = -(wavelength - 440) / (440 - 380)
            green = 0.0
            blue = 1.0
        elif(wavelength >= 440 and wavelength<490):
            red = 0.0
            green = (wavelength - 440) / (490 - 440)
            blue = 1.0
        elif(wavelength >= 490 and wavelength<510):
            red = 0.0
            green = 1.0
            blue = -(wavelength - 510) / (510 - 490)
        elif(wavelength >= 510 and wavelength<580):
            red = (wavelength - 510) / (580 - 510)
            green = 1.0
            blue = 0.0
        elif(wavelength >= 580 and wavelength<645):
            red = 1.0
            green = -(wavelength - 645) / (645 - 580)
            blue = 0.0
        elif(wavelength >= 645 and wavelength<781):
            red = 1.0
            green = 0.0
            blue = 0.0
        else:
            red = 0.0
            green = 0.0
            blue = 0.0
        
        if(wavelength >= 380 and wavelength<420):
            factor = 0.3 + 0.7*(wavelength - 380) / (420 - 380)
        elif(wavelength >= 420 and wavelength<701):
            factor = 1.0
        elif(wavelength >= 701 and wavelength<781):
            factor = 0.3 + 0.7*(780 - wavelength) / (780 - 700)
        else:
            factor = 0.0

        if (red != 0):
            red = round(intensityMax * pow(red * factor, gamma))
        if (green != 0):
            green = round(intensityMax * pow(green * factor, gamma))
        if (blue != 0):
            blue = round(intensityMax * pow(blue * factor, gamma))
        
        waveDict = {
            "wavelength": wavelength,
            "R": red,
            "G": green,
            "B": blue
        }

        return waveDict

    def getClosestValue(self, value, color, waveArray):
        return waveArray[min(range(len(waveArray)), key = lambda i: abs(waveArray[i][color]-value))][color]

    def rgbToNm(self, R, G, B, waveArray):
        # We expect images with wavelength in the range 550-570 so we will account
        # for range 510-610 where all values of B = 0
        
        # Create list with where B == 0
        waveArrayRG = []
        for index in range(len(waveArray)):
            waveArray[index]["B"] = 0
            waveArrayRG.append(waveArray[index])

        # Check for out of range
        if(abs(G-R) >= 30 and (G-R) < 0):
            return -1

        # Get closest value for R
        RR = self.getClosestValue(R, "R", waveArrayRG)

        # Return wave aproximation
        for index in range (len(waveArrayRG)):
            if(waveArrayRG[index]["R"] == RR):
                return waveArrayRG[index]["wavelength"]

            

