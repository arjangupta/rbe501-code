# For [0 315 420 610] = rectangle (left bottom right top)
#
#      ****************************************************
#  610 ----------------------X 420,610                    *
#      |                     |                            *
#      |                     |                            *
#      |                     |                            *
#      |                     |                            *
#      |                     |                            *
#      |                     |                            *
#      |                     |                            *
#      |0,315                |                            *
#  315 X----------------------                            *
#      *                                                  *
#      *                                                  *
#      *                                                  *
#      *                                                  *
#      *                                                  *
#      *                                                  *
#      *                                                  *
#      *                                                  *
#    0 ****************************************************
#      0                    420

gs                               \
  -o cropped.pdf                 \
  -sDEVICE=pdfwrite              \
  -c "[/CropBox [0 200 900 400]" \
  -c " /PAGES pdfmark"           \
  -f uncropped-input.pdf