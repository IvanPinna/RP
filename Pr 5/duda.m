%Ejemplo en el cual simplemente toma las 4 caracter�sticas y calcula los centroides.

clear; 
load iris.mat;

%Falta barajar los datos para generalizar.
centroides = kmeans(x, 3);
for i = 1:3
    centroides = kmeans
end

%Para cada patr�n, buscar la distancia minima a cada centroide
for i = 1:3
    dist(i,:) = d_euclid(x, centroides(:,i));
end

[bas pos] = min(dist);
%�C�mo sabes a que centroide pertenece cada clase?
