;  $Id: //depot/idl/IDL_70/idldir/examples/doc/image/lowpassfiltering.pro#2 $

;  Copyright (c) 2005-2008, ITT Visual Information Solutions. All
;       rights reserved.
; 
PRO LowPassFiltering

; Import the image from the file.
file = FILEPATH('nyny.dat', $
   SUBDIRECTORY = ['examples', 'data'])
imageSize = [768, 512]
image = READ_BINARY(file, DATA_DIMS = imageSize)

; Crop the image to focus in on the bridges.
croppedSize = [96, 96]
croppedImage = image[200:(croppedSize[0] - 1) + 200, $
   180:(croppedSize[1] - 1) + 180]

; Initialize the display.
DEVICE, DECOMPOSED = 0
LOADCT, 0
displaySize = [256, 256]

; Create a window and display the cropped image.
WINDOW, 0, XSIZE = displaySize[0], YSIZE = displaySize[1], $
   TITLE = 'Cropped New York Image'
TVSCL, CONGRID(croppedImage, displaySize[0], $
   displaySize[1])

; Create a low pass filter.
kernelSize = [3, 3]
kernel = REPLICATE((1./(kernelSize[0]*kernelSize[1])), $
   kernelSize[0], kernelSize[1])

; Apply the filter to the image.
filteredImage = CONVOL(FLOAT(croppedImage), kernel, $
   /CENTER, /EDGE_TRUNCATE)

; Create another window and display the resulting
; filtered image.
WINDOW, 1, XSIZE = displaySize[0], YSIZE = displaySize[1], $
   TITLE = 'Low Pass Filtered New York Image'
TVSCL, CONGRID(filteredImage, displaySize[0], $
   displaySize[1])

; Create another window and display the combined image.
WINDOW, 2, XSIZE = displaySize[0], YSIZE = displaySize[1], $
   TITLE = 'Low Pass Combined New York Image'
TVSCL, CONGRID(croppedImage + filteredImage, $
   displaySize[0], displaySize[1])

END