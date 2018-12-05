[x,y]=meshgrid(-10:0.1:15,-10:0.1:15);
f = 100*(x.^2 - y.^2) + (1+x).^2
pcolor(x,y,f),shading flat;hold on;
sol = [10;10]%ginput(1)';

for i = 1:1000
    x = sol(1, i);
    y = sol(2, i);
    
    dx = 2*(x-1) + 200*x;
    dy = -200*y;
    dxx = 202;
    dyy = -200;
    dxy = 0;
    dyx = 0;
    
    H = [dxx dxy; dyx dyy];
    sol(:,i+1) = sol(:,i) - 0.1 * inv(H)  * ([dx;dy]);       
    plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r'); %¿Por qué dibuja dos puntos?
end

%Minimo de la funcion tomando como punto inicial 
%(10,10) ->  (0.0099,1.7479e-45)