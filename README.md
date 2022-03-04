# RasterPhotoLinear
Make sure the code (the .PDE file) is placed in a folder with the same name as the PDE file. In this case, that would be "RasterPhotoLinear".

At the moment, running the file will always generate a PDF file.

## CAD/CAM Operation:
I use brush pens as the tool attached to the CNC machine- I like these [refillable brush pens](https://www.joann.com/arteza-refillable-water-brush-pens-assorted-tips-4pk/18758813.html) filled with india ink.

To get CAD/CAM software to vary the height, use engraving operations. These operations are typically meant for CNC bits that have a V-shaped profile and the engraving will cut deeper where the vector is wider.  With the brush pen, it presses more into the surface causing the varying line width needed for the effect to work.

I set 0 in the Z axix where the brush pen is almost letting ink on the paper. You want the brush to be making very thin lines where the vector shapes are thin and thick lines where the vector is deep.

Effectively, the V-shaped bit and the engraving CAD/CAM operation are lies and the size of the "bit" (and angle of the V) can be manipulated in order to get the depths just right. You definitely should check to make sure the toolpath isn't going to go down further than the brush should. With the brush pen I used, that's somewhere around .25inch - maybe a little more at most.  
