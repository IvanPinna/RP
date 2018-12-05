%Ejercicio 1 
clear all;close all;
for i = -2:0.05:2
    hold on;
    plot(i, 2*(i.^2)+3, '.r');
    
end
hold off;

for i = 2:0.01:4
    hold on;
    plot(i, 2*i +1, '.r');
end
hold off;

%Ejercicio 2
clear all;close all;
x = -5:0.02:5;
subplot(2,1,1), plot(2,1,'+r'), hold on, plot(x, x.^2 - 3*x - 2), hold off;
subplot(2,1,2), plot(2,1,'+r'), hold on, plot(x, x.^3 - 2*x + 1), hold off;

%Ejercicio 3
clear all; close all;
Imagen = imread('spine.tif');
ImRuido = imnoise(Imagen,'salt & pepper',0.05);
%imshow(Imagen);
subplot(3,2,1), subimage(Imagen), title ('Imagen original');
subplot(3,2,2), subimage(ImRuido), title ('Imagen con ruido');
subplot(3,2,3), subimage(imfilter(ImRuido, fspecial('average'))), title('Filtro media');
subplot(3,2,4), subimage(imfilter(ImRuido, fspecial('gaussian'))), title('Filtro gaussiano');
subplot(3,2,5), subimage(medfilt2(imnoise(ImRuido))), title('Filtro mediana');
%El mejor resultado en este caso se obtiene con el filtro de la mediana. 

%Ejercicio 4 RUIDO GAUSSIANO 
clear all; close all;
Imagen = imread('peppers.png');
ImRuido = imnoise(Imagen,'gaussian');
subplot(3,2,1), subimage(Imagen), title ('Imagen original');
subplot(3,2,2), subimage(ImRuido), title ('Imagen con ruido');
subplot(3,2,3), subimage(imfilter(ImRuido, fspecial('average'))), title('Filtro media');
subplot(3,2,4), subimage(imfilter(ImRuido, fspecial('gaussian'))), title('Filtro gaussiano');
subplot(3,2,5), subimage(medfilt2(imnoise(ImRuido))), title('Filtro mediana'); 

