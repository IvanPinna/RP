clc, clear, close all;

rand('seed', 0); 
randn('seed', 0); 
x = rand(1,100); 
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x)); 