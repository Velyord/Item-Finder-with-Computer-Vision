![Item-Finder-with-Computer-Vision](https://th.bing.com/th/id/OIG3.DLmIEiLkE8r2OttIp8Uu?pid=ImgGn)
# Item-Finder-with-Computer-Vision
---
skeletonImage is loaded as an image from a file named "skeleton.jpg" and converted to a black and white image with the rgb2gray() function.

allImage is loaded in the same way. It contains the skeleton object as well as other objects in a "scattered" setting.

The first image (skeletonImage) is displayed with the imshow() function and a title is added.

The same is done for the second image (allImage).

The detectSURFFeatures() functions are used to detect the points of interest in the two datasets (skeletonImage and allImage).

Once the points of interest are detected, the extractFeatures() function is used to extract the features of those points.

The matchFeatures() function is used to compare the features of the points of interest between the two datasets.

The estimateGeometricTransform() function is used to estimate the geometric transformation between the two sets of points.

The place in the general picture where the object was found is outlined.
![Item-Finder-with-Computer-Vision-1](https://i.imgur.com/XnCu4Hj.png)
![Item-Finder-with-Computer-Vision-2](https://i.imgur.com/AVthcg7.png)
![Item-Finder-with-Computer-Vision-3](https://i.imgur.com/kIV9NAY.png)
![Item-Finder-with-Computer-Vision-4](https://i.imgur.com/fSFhnxe.png)
![Item-Finder-with-Computer-Vision-5](https://i.imgur.com/5WcfonX.png)
![Item-Finder-with-Computer-Vision-6](https://i.imgur.com/5ys1l9Y.png)
![Item-Finder-with-Computer-Vision-7](https://i.imgur.com/Bj6hLS6.png)
