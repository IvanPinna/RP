clear, close all;
rng(0); %inicializamos la semilla a 0
tam = 1000;
muestra1 = randnorm([0,0], [1 0.8; 0.8 2], tam) ;
muestra2 = randnorm([3,3], [1 -0.9; -0.9 2], tam);
datos = [muestra1 muestra2];

%Mezclamos los datos.
secuencia = shuffle(1:tam*2);
x = datos(:, secuencia);
y = ones(1,2000);
y(find(secuencia > 1000)) = 2;

%Calculo prototipo y distancia a ese prototipo
for i = 1:2 
    ind = find(y(1:1600) == i);
    prototipo(:,i) = [meanpat(x(1, ind)) meanpat(x(2, ind))];
    dist(i,:) = d_euclid(x(:,1601:2000),prototipo(:,i));
    %Mahalannobis
    m(:,i) = meanpat(x(:,ind));%Calculo de la media
    C{i} = covpat(x(:,ind)); %Calculo matriz covarianza
    dist_mahal(i,:) = d_mahal(x(:,1601:2000) ,m(:,i), C{i});
   
end

[basura, prediccion] = min(dist); %Buscar ese valor en que fila se encuentra. 
[basura, prediccion_mahal] = min(dist_mahal);

%Calcular tasa de acierto.
tasa_acierto = sum(prediccion==y(1601:2000))/400*100 
tasa_acierto_mahal = sum(prediccion_mahal==y(1601:2000))/400*100 

%A)La tasa de acierto con la distancia euclidea es del 94.75%
%B)La tasa de acierto con la distancia de mahalannobis es del 98.25%

%C 
plot(muestra1(1,:), muestra1(2,:), '.r'); hold on; %NO BORRAR
plot(muestra2(1,:), muestra2(2,:), '.b'); hold off;
