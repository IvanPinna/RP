%Ejemplo en el cual simplemente toma las 4 características y calcula los centroides.
clear, clc, close all; 
load iris.mat;

%Barajar los datos. 
random = randperm(size(y,2));
x_rand = x(:,random);
y_rand = y(:,random);


for i = 1:3 %Calculo centroides y distancia. 
    centroide(:,i) = kmeans(x_rand(:,find(y_rand == (i-1))),1);
    dist(i,:) = d_euclid(x_rand, centroide(:,i));
end

[bas pos] = min(dist);
tasa_acierto = (sum(pos == (y_rand+1))/size(y_rand,2))*100; %Tasa de acierto aprox 90%


