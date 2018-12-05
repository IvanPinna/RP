clear,clc, close all;
rand('seed',0);
A=round(20+randn(1,500)*5); %Golden. Doradas
B=round(30+randn(1,500)*2); %Bass.  Lubinas
histogram(A);
figure, histogram(B);
