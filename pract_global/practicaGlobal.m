clear, clc, close all;
IM = imread('CuadriculaIvan.jpg');
%imshow(IM);
IMGris = rgb2gray(IM);
imBN = im2bw(IM); %0 black 1 white.

%Localizar los recuadros negros. 
[row, col] = find(imBN == 0);
%Dividir la cuadricula en patrones.  

sector = IM(1:size(IM,1)/2, 1:size(IM,1)/2);