%Ejemplo con dos minimos 
clear all; close all;
[x,y]=meshgrid(-3:0.1:3,-4:0.1:4);
z = (x.^4 - 3*x.^2 + x + y.*y + x.*y);
while(1),
    close all
    pcolor(x,y,z),shading flat;hold on;
    sol = ginput(1)';
    for i=1:100,
       x=sol(1,i);
       y=sol(2,i);
       dx = 4 * x.^3 - 6*x + 1 + y; %Caclula la derivada. 
       dy = 2 * y + x;
       sol(:,i+1) = sol(:,i) - 0.1 * [dx;dy];
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
       %pause
    end;
    pause
end;



%Otro ejemplo
clear all
x = [1 2 4 4 5 6 7 8]';
y = [1 4 3 5 7 6 6 8]';
A = [x ones(size(x))];

weights = [0.8 1]';
P = weights;

m = -1:0.05:2;
b = -1:0.05:3;
[bgrid,mgrid] = meshgrid(b,m);
for i=1:length(m),
    for j=1:length(b),
        weights = [m(i) b(j)]';
        estim = A * weights;
        error(j,i) = log(sumsqr(y - estim));
    end
end

while(1),
   close all
   pcolor(m,b,error),shading interp,colorbar,hold on
   xlabel('b','FontSize',12)
   ylabel('m','FontSize',12)
   weights=ginput(1)'; 
   P=weights;
   for i=1:1000,
      estim = A * weights;
      aux = repmat(estim-y,1,size(A,2));
      gradiente = sum(aux.* A);
      weights = weights - 0.001 * gradiente';
      P = [P weights];
   end;
   comet(P(1,:),P(2,:));
   pause
end;


%Ejemplo derivadas matlab. 
syms x 
f = x.^2;
df = diff(f, x) %Casca porque x es un array, no una variable simbolica. 
subs(df, x, 3) %Devuelve el calculo de la variable en un punto dado. 
