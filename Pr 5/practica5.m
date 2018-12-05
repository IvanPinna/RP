clear, clc, close all; 
load iris.mat;
%Falta barajar los datos para generalizar.


caract = 1:4;
for k = 2:4 %Caracteristicas a tener en cuenta. 
    tasa_acierto = 0;
    comb = nchoosek(caract, k); %Combinaciones de 2 caracteristicas. 
    for ncentr = 1:5
        for i = 1:size(comb,1)
            centroides = kmeans(x(comb(i,:),:),3*ncentr); %Posicion de los centroides y nº de centroides. 
            %Comprobar tasa de acierto.
            for j = 1:3
                dist(j,:) = d_euclid(x(comb(i,:),:), centroides(:,j));
            end
            [basura clase] = min(dist);
            %Contar el numero de aciertos.
            tasa_acierto(i) = sum(clase==y)/length(y)*100;
        end
    resultado(k, ncentr) = mean(tasa_acierto)

    end
end
%Graficar
plot(1:5,resultado(2,:), 'r'); hold on;
plot(1:5,resultado(3,:), 'b');
plot(1:5,resultado(4,:), 'y'); 
legend({'2 características)','3 características', '4 características'},'Location','southwest')
hold off;
