clear; clc;
x=[0 0.6 1.1 1.7 2.2 2.8 3.3 3.9 4.4 5]'; 
y=[0.5 0.7 0.9 1.2 1.5 2 2.6 3.5 4.6 6.1]'; 
% cambio de variable en los datos 
yp=log(y); 
% solucion del problema lineal 
A = [x ones(size(x))]; 
sol = inv(A'*A)*(A'*yp); 
B=sol(1); C=sol(2); 
% calculamos los parámetros de la exponencial 
A=exp(C); 
plot (x,y,'o'); 
axis([0 5 0 7]); hold on; 
plot (x,A*exp(B*x),'r'); hold off;