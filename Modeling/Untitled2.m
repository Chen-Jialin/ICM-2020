x = linspace(0,100);
y = linspace(0,100);
[X,Y] = meshgrid(x,y);
a=((1.05*(100-X)).^2+(0.68*(55.4-Y)).^2).^(1/2);
b=((1.05*(100-X)).^2+(0.68*(44.6-Y)).^2).^(1/2);
theta=acos((a.^2+b.^2-7.32.^2)./(2*a.*b));
d=((1.05*(100-X)).^2+(0.68*(50-Y)).^2).^(1/2);
D=(1-d./110.37).^2;
T=(log(theta+1))/(log(pi+1));
P=0.5*D+0.5*T;
PP=real(P);
surfc(1.05*X,0.68*Y,PP)
shading interp
colorbar
colormap(hot)
axis equal
view([0,90])