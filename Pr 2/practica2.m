%EJERCICIO 1
%a
x = [90, 86, 67, 89, 81, 75];
y = [62, 45, 40, 55, 64, 53];
figure, plot(x,y, 'o');
axis([ 0 200, 0 1000]);
plot(x,y, 'o');
%Respuesta: Aparentemente no hay relación. Sin embargo si modificamos 
% la escala podemos ver que si existe cierta relación ascendente entre 
% los datos. 

%b
x = x'; y = y';
A = [x ones(size(y))];
coefs = inv(A'*A)*(A'*y);
r = y - A*coefs;
E = r'*r;
hold on;
plot(x, A*coefs); %¿?
hold off;
%Respuesta: Ecuacion de la recta y = 0.5947*x + 4.7990
%Los coeficientes intentan ajustar la recta a los 
%puntos (x,y).

%c. Disminuye el error ya que permite a la recta 
%posicionarse de forma mas acorde a los puntos. 

heartRate = 88*coefs(1) + coefs(2);
%d. Predicción -> 57 latidos.

%e. 

%f
plot(x,y, 'or');
x = [90, 86, 67, 89, 81, 75]'; y = [62, 45, 40, 55, 64, 53]';
[xo po] = sort(x);
yo = y(po);
x2 = xo.*xo;
A = [x2 xo ones(size(y))];
coefs = inv(A'*A)*(A'*yo);
r = yo - A*coefs;
E = r'*r;
hold on;
plot(xo, A*coefs, 'b'); %¿?
hold off;
%Respuesta: El error disminuye a 244 

%g.
x = [90, 86, 67, 89, 81, 75]'; y = [62, 45, 40, 55, 64, 53]';
[xo po] = sort(x);
yo = y(po);
figure, plot(xo,yo, 'or');
x2 = xo.*xo;
x3 = xo.*x2;
A = [x3 x2 xo ones(size(y))];
coefs = inv(A'*A)*(A'*yo);
r = yo - A*coefs;
E = r'*r;
hold on;
plot(xo, A*coefs, 'b'); %¿?
hold off;
%Respuesta: El modelo se ajusta mejor, disminuyendo el error hasta 144

%h Buscar el polinomio que mejor se ajuste  
clear; clc;
x = [90, 86, 67, 89, 81, 75]'; y = [62, 45, 40, 55, 64, 53]';
%[xo po] = sort(x); Ordenacion pero ortopedica
%yo = y(po);
y = 1./(y.*y);
yp = log(y); %Cambio de variable y resolucion lineal.   
A = [x ones(size(x))];
coefs = inv(A'*A)*(A'*yp);
B = coefs(1); C= coefs(2); 
A = exp(C)
plot(x, y, 'or'); %axis([0 1 0 1]);
hold on;
x = linspace(min(x), max(x));
plot(x, A*exp(B*x), 'b'); 
hold off;
%Respuesta: Hay que hacer un cambio de variables 
%   para adapatar el modelo exp a modelo lineal.

%i
clear; clc;
x = [90, 86, 67, 89, 81, 75]';
y = [62, 45, 40, 55, 64, 53]';
x2 = x/100; y2 = 3*x2.*exp(2*x2);

yp = log(y2./x2);
A = [x2 ones(size(x2))];
coefs = inv(A'*A)*(A'*yp);
B = coefs(1); C= coefs(2); 
A = exp(C)
plot(x2, y2, 'or'); 
hold on;
x3 = linspace(min(x2), max(x2));
plot(x3, A*x3.*exp(B*x3), 'b'); 
hold off;


%EJERCICIO 2
%a -> b
x = [90, 86, 67, 89, 81, 75];
y = [62, 45, 40, 55, 64, 53];
plot(x,y, 'o');
hold on;
plot(x, polyval(polyfit(x,y,1),x));
hold off;

%a -> f
x = [90, 86, 67, 89, 81, 75];
y = [62, 45, 40, 55, 64, 53];
[xo po] = sort(x); %Ordenacion pero ortopedica
yo = y(po);
plot(xo,yo, 'o');
hold on;
plot(xo, polyval(polyfit(xo,yo,2),x));
hold off;

%a -> g 
x = [90, 86, 67, 89, 81, 75];
y = [62, 45, 40, 55, 64, 53];
[xo po] = sort(x); %Ordenacion pero ortopedica
yo = y(po);
figure, plot(xo,yo, 'o');
hold on;
plot(xo, polyval(polyfit(xo,yo,3),x));
hold off;

%a -> h
clear all; clc;
x = [90, 86, 67, 89, 81, 75]'; y = [62, 45, 40, 55, 64, 53]';
y = 1./(y.*y);
[xo po] = sort(x); %Ordenacion 
yo = y(po);
figure, plot(xo, yo, 'o');
hold on, plot(xo, polyval(polyfit(xo,yo,5),xo));
hold off;
for i = 1:8 %Calculo del error
    E(i) = sum(yo - polyval(polyfit(xo,yo,i),xo));
end 
figure, plot(1:8, E, 'r'); %Como podemos observar, el valor mas cercano a 0 se obtiene para un polinomio de grado 9. 

%a -> i
clear; clc;
x = [90, 86, 67, 89, 81, 75]';
y = [62, 45, 40, 55, 64, 53]';
x2 = x/100; y2 = 3*x2.*exp(2*x2);
figure, plot(x2, y2, 'o');
[xo po] = sort(x2); %Ordenacion 
yo = y2(po);
hold on, plot(xo, polyval(polyfit(xo,yo,5),xo));
hold off;
for i = 1:10 %Calculo del error
    E(i) = sum(yo - polyval(polyfit(xo,yo,i),xo));
end 
figure, plot(1:10, E, 'r');%El valor mas cercano a 0 se obtiene para un polinomio de grado 8. 


%Entiendo que hay que tomar los apartados f y g del apartado a de 
%este mismo ejercicio
%b -> f
x = [90, 86, 67, 89, 81, 75];
y = [62, 45, 40, 55, 64, 53];
coeficientes = polyfit(x,y,2);
raices = roots(coeficientes);

%b -> g
x = [90, 86, 67, 89, 81, 75];
y = [62, 45, 40, 55, 64, 53];
coeficientes = polyfit(x,y,3);
raices = roots(coeficientes);
