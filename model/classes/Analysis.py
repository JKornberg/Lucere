# Analysis Lucere class

import numpy as np
from math import sqrt
import matplotlib.pyplot as plt
from skimage import data, io, color, segmentation, filters
from skimage.feature import blob_dog, blob_log, blob_doh
from skimage.future import graph
from skimage.color import rgb2gray, rgb2hsv
from skimage.data import gravel
from skimage.filters import difference_of_gaussians, window, meijering, sato, frangi, hessian
from scipy.fftpack import fftn, fftshift
import tempfile
import threading

class Analysis:
    def __init__(self):
        pass
    
    def threaded(fn):
        def wrapper(*args, **kwargs):
            thread = threading.Thread(target=fn, args=args, kwargs=kwargs)
            thread.start()
            return thread
        return wrapper
    
    @threaded
    def runPlotBlob(self, imagePathList = []):
        scanPaths = "model/classes/"

        for i in range(len(imagePathList)):
            image = io.imread(scanPaths + imagePathList[i])
            image_gray = rgb2gray(image)

            blobs_log = blob_log(image_gray, max_sigma=30, num_sigma=10, threshold=.1)

            # Compute radii in the 3rd column.
            blobs_log[:, 2] = blobs_log[:, 2] * sqrt(2)

            blobs_dog = blob_dog(image_gray, max_sigma=30, threshold=.1)
            blobs_dog[:, 2] = blobs_dog[:, 2] * sqrt(2)

            blobs_doh = blob_doh(image_gray, max_sigma=30, threshold=.01)

            blobs_list = [blobs_log, blobs_dog]
            colors = ['yellow', 'lime']
            titles = ['Laplacian of Gaussian', 'Difference of Gaussian']
            sequence = zip(blobs_list, colors, titles)

            fig, axes = plt.subplots(1, 2, figsize=(16, 9), sharex=True, sharey=True)
            ax = axes.ravel()
            plt.style.use('dark_background')

            for idx, (blobs, color, title) in enumerate(sequence):
                # ax[idx].set_title(title)
                ax[idx].imshow(image)
                for blob in blobs:
                    y, x, r = blob
                    c = plt.Circle((x, y), r, color=color, linewidth=2, fill=False)
                    ax[idx].add_patch(c)
                ax[idx].set_axis_off()

            plt.tight_layout()
            plt.savefig(tempfile.gettempdir() + "/" + str(i) + "_analysis.jpg")
    
    @threaded
    def runPlotDog(self, imagePathList):
        scanPaths = "model/classes/"
        for i in range(len(imagePathList)):
            image = io.imread(scanPaths + imagePathList[i])
            wimage = image * window('hann', image.shape)  # window image to improve FFT
            filtered_image = difference_of_gaussians(image, 1, 12)
            filtered_wimage = filtered_image * window('hann', image.shape)
            im_f_mag = fftshift(np.abs(fftn(wimage)))
            fim_f_mag = fftshift(np.abs(fftn(filtered_wimage)))

            fig, ax = plt.subplots(nrows=1, ncols=3, figsize=(16, 9))
            ax[0].imshow(image, cmap='gray')
            ax[1].imshow(filtered_image, cmap='gray')
            ax[2].imshow(np.log(fim_f_mag), cmap='magma')
            plt.style.use('dark_background')
            plt.tight_layout()
            plt.savefig(tempfile.gettempdir() + "/" + str(i) + "_analysis.jpg")

    @threaded
    def runPlotRgb2Hsv(self, imagePathList):
        scanPaths = "model/classes/"
        for i in range(len(imagePathList)):
            image = io.imread(scanPaths + imagePathList[i])
            rgb_img = image
            hsv_img = rgb2hsv(rgb_img)
            hue_img = hsv_img[:, :, 0]
            value_img = hsv_img[:, :, 2]

            fig, (ax1, ax2) = plt.subplots(ncols=2, figsize=(16, 9))
            plt.style.use('dark_background')

            ax1.imshow(hue_img, cmap='hsv')
            ax1.axis('off')
            ax2.imshow(value_img)
            ax2.axis('off')

            fig.tight_layout()
            plt.savefig(tempfile.gettempdir() + "/" + str(i) + "_analysis.jpg")

    @threaded
    def runPlotRidge(self, imagePathList):
        scanPaths = "model/classes/"
        for i in range(len(imagePathList)):
            def identity(image, **kwargs):
                """Return the original image, ignoring any kwargs."""
                return image

            image = io.imread(scanPaths + imagePathList[i])
            cmap = plt.cm.gray

            kwargs = {'sigmas': [1], 'mode': 'reflect'}

            fig, axes = plt.subplots(2, 3, figsize=(16, 9))
            for i, black_ridges in enumerate([1, 0]):
                for j, func in enumerate([identity, meijering, hessian]):
                    kwargs['black_ridges'] = black_ridges
                    result = func(image, **kwargs)
                    axes[i, j].imshow(result, cmap=cmap, aspect='auto')
                    if j == 0:
                        axes[i, j].set_ylabel('black_ridges = ' + str(bool(black_ridges)))
                    axes[i, j].set_xticks([])
                    axes[i, j].set_yticks([])

            plt.style.use('dark_background')
            plt.tight_layout()
            plt.savefig(tempfile.gettempdir() + "/" + str(i) + "_analysis.jpg")

    @threaded    
    def runPlotSegmentation(self, imagePathList):
        scanPaths = "model/classes/"
        for i in range(len(imagePathList)):
            image = io.imread(scanPaths + imagePathList[i])
            gimg = color.rgb2gray(image)

            labels = segmentation.slic(image, compactness=30, n_segments=800, start_label=1)
            edges = filters.sobel(gimg)
            edges_rgb = color.gray2rgb(edges)

            g = graph.rag_boundary(labels, edges)
            lc = graph.show_rag(labels, g, edges_rgb, img_cmap=None, edge_cmap='viridis',
                                edge_width=1.2)

            plt.colorbar(lc, fraction=0.03)
            plt.tight_layout()
            plt.savefig(tempfile.gettempdir() + "/" + str(i) + "_analysis.jpg")