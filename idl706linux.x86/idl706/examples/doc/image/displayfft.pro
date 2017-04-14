;  $Id: //depot/idl/IDL_70/idldir/examples/doc/image/displayfft.pro#2 $

;  Copyright (c) 2005-2008, ITT Visual Information Solutions. All
;       rights reserved.
; 
PRO DisplayFFT

; Import the image from the file.
imageSize = [64, 64]
file = FILEPATH('abnorm.dat', $
   SUBDIRECTORY = ['examples', 'data'])
image = READ_BINARY(file, DATA_DIMS = imageSize)

; Initialize a display size parameter to resize the
; image when displaying it.
displaySize = 2*imageSize

; Initialize the display.
DEVICE, DECOMPOSED = 0
LOADCT, 0

; Create a window and display the image.
WINDOW, 0, XSIZE = displaySize[0], YSIZE = displaySize[1], $
   TITLE = 'Original Image'
TVSCL, CONGRID(image, displaySize[0], $
   displaySize[1])

; Transform the image into the frequency domain.
ffTransform = FFT(image)

; Shift the zero frequency location from (0, 0) to
; the center of the display.
center = imageSize/2 + 1
fftShifted = SHIFT(ffTransform, center)

; Calculate the horizontal and vertical frequency
; values, which will be used as the values for the
; axes of the display.
interval = 1.
hFrequency = INDGEN(imageSize[0])
hFrequency[center[0]] = center[0] - imageSize[0] + $
   FINDGEN(center[0] - 2)
hFrequency = hFrequency/(imageSize[0]/interval)
hFreqShifted = SHIFT(hFrequency, -center[0])
vFrequency = INDGEN(imageSize[1])
vFrequency[center[1]] = center[1] - imageSize[1] + $
   FINDGEN(center[1] - 2)
vFrequency = vFrequency/(imageSize[1]/interval)
vFreqShifted = SHIFT(vFrequency, -center[1])

; Compute the power spectrum of the transform.
powerSpectrum = ABS(fftShifted)^2

; Apply a logarithmic scale to the power spectrum.
scaledPowerSpect = ALOG10(powerSpectrum)

; Create another window and display the log-scaled
; power spectrum as a surface.
WINDOW, 1, TITLE = 'FFT Power Spectrum: ' + $
   'Logarithmic Scale (surface)'
SHADE_SURF, scaledPowerSpect, hFreqShifted, vFreqShifted, $
   /XSTYLE, /YSTYLE, /ZSTYLE, $
   TITLE = 'Log-scaled Power Spectrum', $
   XTITLE = 'Horizontal Frequency', $
   YTITLE = 'Vertical Frequency', $
   ZTITLE = 'Log(Squared Amplitude)', CHARSIZE = 1.5

; Create another window and display the log-scaled
; power spectrum as an image.
WINDOW, 2, XSIZE = displaySize[0], YSIZE = displaySize[1], $
   TITLE = 'FFT Power Spectrum: Logarithmic Scale (image)'
TVSCL, CONGRID(scaledPowerSpect, displaySize[0], $
   displaySize[1])

END