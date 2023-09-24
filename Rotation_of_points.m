clc;
clear;
n=100;
x1=randn(n,1);
y1=.5*randn(n,1);

plot(x1,y1,'o')
hold on;

x2=randn(n,1)+1;
y2=0.2*randn(n,1)-2;

theta=pi/4;
A=[cos(theta) -sin(theta); sin(theta) cos(theta)]; % rotation matrix

% rotation_matrix * a_point ==> rotated_point
for i=1:n;
    % rotating each point of x2 and y2 by theta amount
    rotated_points(1:2,i)=A*[x2(i);y2(i)];   
end

plot(rotated_points(1,:),rotated_points(2,:),'*');
% hold off;