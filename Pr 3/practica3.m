clear; close all;
syms x y

f = sin(0.5*x.^2 - 0.25*y.^2 + 3).*cos(x.*2 + 1 + exp(y));
dx = diff(f, x);
dy = diff(f, y);
paso = 1;

[X,Y]=meshgrid(-1:0.1:1,-1:0.1:1); %Necesario emplear distintas variables. 
z = sin(0.5*X.^2 - 0.25*Y.^2 + 3).*cos(X.*2 + 1 + exp(Y)); %Nos apoyamos en las variables no simbolicas. 
  
pcolor(X,Y,z),shading flat;hold on;
sol = ginput(1)';

dist = 1; %Inicializar
i = 1;
while i<20000 && dist ~= 0 %Limite maximo de iteraciones
    valordx = subs(dx,{x,y},{sol(1,i),sol(2,i)});
    valordy = subs(dy,{x,y},{sol(1,i),sol(2,i)});
    sol(:,i+1) = sol(:,i) - paso * double([valordx;valordy]);
    plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
    dist = sum(sol(:,i) - sol(:,i+1));
    i = i + 1;
end

%a -> realiza 548 iteraciones hasta que llega el minimo, es decir, la
%distancia entre el punto anterior y el actual es 0. 

%b -> realiza 2902 iteraciones. Es razonable ya que la distancia que avanza
%en cada iteracion del algoritmo es menor. 

%c -> el programa no termina nunca de iterar. Esto ocurre porque el paso es
%demasiado grande y nunca llega a pararse en el mínimo, lo sobrepasa una y
%otra vez. En la gráfica incluso se puede observar como salta de un mínimo
%a otro debido a que al ser tan grande y dar el paso se coloca mas cerca
%del otro mínimo. 