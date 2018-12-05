clear, clc, close all; 
load iris.mat;

%Barajar los datos. 
random = shuffle(1:150);
[x_rand, y_rand] = shuffle(x,y);

for caract = 2:4 %Num de caracteristicas.  
    comb = nchoosek(1:4,caract)';
    centroide = zeros(caract,3); %Reseteo centroides
    for k = 1:size(comb,2)
        combinacion = comb(:,k); %Recoges las caracteristicas que vas a tener en cuenta. 
        for j = 1:3 
            centroide(:,j) = kmeans(x_rand(combinacion, find(y == j-1)),1); %1 centroide por clase. 
            dist(j,:) = d_euclid(x_rand(combinacion, :), centroide(:,j));
        end
        %Encontrar la distancia minima.
        [bas pos] = min(dist);
        tasa_acierto(caract,k) = (sum(pos == (y_rand+1))/size(y_rand,2))*100; %Tasa de acierto aprox 90%
    end
    %Sumar la tasa de 
end




