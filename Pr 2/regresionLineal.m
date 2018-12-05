clear; clc;
x=[1 2 4 4 5 6 7 8]'; 
y=[1 4 3 5 7 6 6 8]'; 

A = [x ones(size(x))]; 
sol = inv(A'*A)*(A'*y); 
r = y-A*sol; %Diferencia entre salida real y la obtenida
E = r'*r; 

%Graficación
plot(x,y, 'or');  
hold on;
plot(x, A*sol, 'b');
hold off