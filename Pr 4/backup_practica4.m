clear, close all;
rng(0); %inicializamos la semilla a 0
tam = 1000;
muestra1 = randnorm([0,0], [1 0.8; 0.8 2], tam) ;
muestra2 = randnorm([3,3], [1 -0.9; -0.9 2], tam);
%Calculo del prototipo para cada muestra 
%prototipo1 = [meanpat(muestra1(1,:)) meanpat(muestra1(2,:))]
%prototipo2 = [meanpat(muestra2(1,:)) meanpat(muestra2(2,:))]
datos = [muestra1 muestra2];

%Mezclamos los datos.
secuencia = shuffle(1:tam*2);
datos_mezcla = datos(:, secuencia);
clases = ones(1,2000);
clases(find(secuencia > 1000)) = 2;

%Calculo prototipo y distancia a ese prototipo
for i = 1:2 
    prototipo(:,i) = [meanpat(datos_mezcla(1, find(clases(1:1600) == i))) meanpat(datos_mezcla(2, find(clases(1:1600) == i)))]
    dist(i,:) = d_euclid(datos_mezcla(:,1601:2000),prototipo(:,i));
end

[basura, prediccion] = min(dist); %Buscar ese valor en que fila se encuentra. 
%Calcular tasa de acierto.
tasa_acierto = sum(prediccion==clases(1601:2000))/400*100 


%APARTADO C 
plot(muestra1(1,:), muestra1(2,:), '.r'); hold on; %NO BORRAR
plot(muestra2(1,:), muestra2(2,:), '.b'); hold off;
