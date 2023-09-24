%%
[x,y] = meshgrid(-2:.2:2,-2:.2:2) ; %to create the points I want to take a look at

%  VectorX = [x./(2*pi*(x.^2+y.^2))]; %is the Vector in the "x" direction
VectorX = sin(x + y);

%  VectorY = [y./(2*pi*(x.^2+y.^2))]; %is the Vector in the "y" direction
VectorY = cos(x - y);

%%
 % A quiver plot displays velocity vectors as arrows with components (u,v) 
 % at the points (x,y).
 quiver(x,y,VectorX,VectorY,'AutoScale','on','AutoScaleFactor',1.5) % 'AutoScale' is used to scale the arrow length.
%  streamslice(x,y,VectorX,VectorY); % it is similar as quiver, instead of 
% drawing arrows it draws streamlines along with the arrows.
 hold on;
%  Z = sqrt(VectorX.^2 + VectorY.^2);
%  contour(x,y,Z,'LineColor','r');
%  
