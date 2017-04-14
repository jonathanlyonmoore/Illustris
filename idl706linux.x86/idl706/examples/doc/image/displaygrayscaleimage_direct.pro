;  $Id: //depot/idl/IDL_70/idldir/examples/doc/image/displaygrayscaleimage_direct.pro#2 $

;  Copyright (c) 2005-2008, ITT Visual Information Solutions. All
;       rights reserved.
; 
PRO DisplayGrayscaleImage_Direct

; Determine the path to the file.
file = FILEPATH('convec.dat', $
   SUBDIRECTORY = ['examples', 'data'])

; Initialize the image size parameter.
imageSize = [248, 248]

; Import in the image from the file.
image = READ_BINARY(file, DATA_DIMS = imageSize)

; Initialize the display.
DEVICE, DECOMPOSED = 0
LOADCT, 0

; Create a window and display the image.
WINDOW, 0, XSIZE = imageSize[0], YSIZE = imageSize[1], $
   TITLE = 'A Grayscale Image'
TV, image

END