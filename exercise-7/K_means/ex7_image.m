%% Machine Learning  Online Class === Exercise 7 |K-Means Clustering and Principle Component Analysis 
% Image Compression
clear all;clc
%% 1.Load image
X = double(imread('lena.png'));
X = X ./ 255; % ��һ����[0,1]
[m,n,l] = size(X);
% ��ÿһ�����ص㿴����һ��������ÿ��������ά����l=3
X  = reshape(X,m*n,l);
% �������������ൽ16���أ����ǰ��������ض����ൽ��16����ɫ������16����ɫ���ع�ͼ�񣬶�������255ɫͼ
K = 50; 
max_iters = 20;
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

%% 2. Image Compression
% �ҵ��ع���ÿһ�����ص���ɫֵ
X_recovered = centroids(idx,:);
X_recovered = reshape(X_recovered,m,n,l);
X = reshape(X,m,n,l);

subplot(1, 2, 1);
imagesc(X); 
title('Original');

subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));