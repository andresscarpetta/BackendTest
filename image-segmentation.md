#Image Segmentation

Algorithm steps:
* Opens image from path.
* Gets image pixels using RMagick.
* Creates the color histogram of the image.
* Creates a collection of 1000 colors with strong presence of red (image has 6841 colors in RGB color space).
* Converts to grayscale all colors not included in the aforementioned collection.
* Writes pixel's changes to image.

Algorithm complexity: O(n*m)
* n: Image pixel rows.
* m: Image pixel columns.
