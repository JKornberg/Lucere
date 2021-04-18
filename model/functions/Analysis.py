import numpy as np
from skimage import data
import skimage
from skimage import io

def getDetection(image):
    averages = (image[:,:,0].astype('float64') + image[:,:,1].astype('float64') ) /2 #Remove blue channel
    flat = averages.flatten()
    flat = np.ma.masked_equal(flat,0).compressed()
    return np.average(flat)

def getWavelength(image):
    return 600

def analyze(path):
    image = io.imread(path)
    value = getDetection(image)
    detected = value > 5 #Replace with threshhold based on data
    wavelength = getWavelength(image)
    return (detected, wavelength, value)

