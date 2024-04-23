clear
clc

skeletonImage = imread('skeleton.jpg');
skeletonImage = rgb2gray(skeletonImage);
figure;
imshow(skeletonImage);
title('Image of a skeleton on a computer');

allImage = imread('all.jpg');
allImage = rgb2gray(allImage);
figure;
imshow(allImage);
title('Image of all items');

skeletonPoints = detectSURFFeatures(skeletonImage);
figure;
imshow(skeletonImage);
title('100 strongest point features from the "skeleton" image');
hold on;
plot(selectStrongest(skeletonPoints, 100));

allPoints = detectSURFFeatures(allImage);
figure;
imshow(allImage);
title('300 strongest point features from the "all" image');
hold on;
plot(selectStrongest(allPoints, 300));

[skeletonFeatures, skeletonPoints] = extractFeatures(skeletonImage, skeletonPoints);
[allFeatures, allPoints] = extractFeatures(allImage, allPoints);
skeletonPairs = matchFeatures(skeletonFeatures, allFeatures);
matchedSkeletonPoints = skeletonPoints(skeletonPairs(:, 1), :);
matchedAllPoints = allPoints(skeletonPairs(:, 2), :);
figure;
showMatchedFeatures(skeletonImage, allImage, matchedSkeletonPoints, ...
matchedAllPoints, 'montage');
title('Putatively Matched Points (Including Outliers)');

[tform, inlierSkeletonPoints, inlierAllPoints] = ...
estimateGeometricTransform(matchedSkeletonPoints, matchedAllPoints,...
'affine');
figure;
showMatchedFeatures(skeletonImage, allImage, inlierSkeletonPoints, ...
inlierAllPoints, 'montage');
title('Matched Points (Inliers Only)');

skeletonPolygon = [1, 1;...
size(skeletonImage, 2), 1;...
size(skeletonImage, 2), size(skeletonImage, 1);...
1, size(skeletonImage, 1);...
1, 1];
newSkeletonPolygon = transformPointsForward(tform, skeletonPolygon);
figure;
imshow(allImage);
hold on;
line(newSkeletonPolygon(:, 1), newSkeletonPolygon(:, 2), 'Color', 'y');
title('Detected skeleton');