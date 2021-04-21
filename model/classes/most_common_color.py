import os
from PIL import Image
import numpy as np


def mostCommonRGBfrom(image):
    # Open image and get data
    
    img = Image.fromarray(image)
    width, height = img.size

    print(width, height, img)

    # The RGB values we will "snap" to
    colors = [255, 252, 249, 246, 243, 240, 237, 234, 231, 228, 225, 222, 219, 216, 213, 210, 207, 204, 201, 198, 195, 192, 189, 185, 182, 179, 176, 173, 169, 166, 163, 160, 156, 153, 150, 146, 140, 130, 120, 110, 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0]

    original_color_count = {}
    color_count = {}
    # Loop through every pixel in the image and modify it
    for w in range(width):
        for h in range(height):
            current_color = img.getpixel((w, h))

            if current_color in original_color_count:
                original_color_count[current_color] += 1
            else:
                original_color_count[current_color] = 1

            r, g, b = current_color
            r_set = False
            g_set = False
            b_set = False

            #  Loop through our allowed values and find the closest value to snap to
            for i in range(len(colors)):
                color_one = colors[i]
                color_two = colors[i + 1]

                if not r_set:
                    if color_one >= r >= color_two:
                        distance_one = color_one - r
                        distance_two = r - color_two
                        r = color_one if distance_one <= distance_two else color_two
                        r_set = True

                if not g_set:
                    if color_one >= g >= color_two:
                        distance_one = color_one - g
                        distance_two = g - color_two
                        g = color_one if distance_one <= distance_two else color_two
                        g_set = True

                if not b_set:
                    if color_one >= b >= color_two:
                        distance_one = color_one - b
                        distance_two = b - color_two
                        b = color_one if distance_one <= distance_two else color_two
                        b_set = True

                if all((r_set, g_set, b_set)):
                    break

            # Set our new pixel back on the image to see the difference
            new_rgb = (r, g, b)
            #img.putpixel((w, h), new_rgb)

            if new_rgb in color_count:
                color_count[new_rgb] += 1
            else:
                color_count[new_rgb] = 1

    # Count and sort the colors
    all_colors = color_count.items()
    all_colors = sorted(all_colors, key=lambda tup: tup[1], reverse=True)

    # Remove black, white and gray
    filtered_colors = [color for color in all_colors if not color[0][0] == color[0][1] == color[0][2]]

    # Remove other blacks
    filtered_colors = [color for color in all_colors if not color[0][0] == color[0][2]]


    # Eliminate all blue colors
    R = int(filtered_colors[0][0][0])
    G = int(filtered_colors[0][0][1])
    B = 0

    print("Common color completed")

    return (R, G, B)
