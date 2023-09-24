clc ;
clear ;
X = rand(100,1);    % creating a random matrix with 2 features

a = 2;
b = 5;
% In the following line, at the end we added some noise.The less noise, the
% more accurate the beta0 and beta1 values are (i.e. closer to 5 and [1 2])
Y = b + (a*X') + rand(1,100); 
plot(X,Y,'bo');

x = [0.3 0.5];
y = [0.6 0.5];
annotation('textarrow',x,y,'String','$h_{\beta}(x)$','Interpreter','Latex','Color','black','FontSize',10,'FontWeight','bold')
% text(.2,7.5,'$h_{\beta}(x)$','Interpreter','Latex','Color','black','FontSize',10,'FontWeight','bold')
% set(gca,'XTick',[], 'YTick', [])
xlabel('House-size','Interpreter','Latex');
ylabel('House-price','Interpreter','Latex');
legend('data','Location','SouthEast')
%%
%%
% this program shows the error line between exact value and approximate
% value
clear all;
clc;
n=50;
x = 10+8*rand(n,1);
y = 20+1.5*x+5*rand(n,1);
x=x-mean(x);
y=y-mean(y);
scatter(x,y);
hold on;
grid on;
axis([-10 10 -30 35]);
xlabel(' House-size ','Interpreter','Latex');
ylabel(' House-price ','Interpreter','Latex');

  p1 = 1.5099;
  p2 = 2.6142e-15;
line = p1*x + p2 ;
plot(x,line,'k-','linewidth',2);

for i=1:length(x)
plot([x(i) x(i)], [y(i) line(i)],'linewidth',2);

end
set(gca,'XTick',[], 'YTick', [])
legend('exact','predicted')
%%
clc ;
clear ;
syms a b;
n=5;
X = rand(n,1);   

beta0 = 2;
beta1 = 5;
% In the following line, at the end we added some noise.The less noise, the
% more accurate the beta0 and beta1 values are (i.e. closer to 5 and [1 2])
Y = beta0 + (beta1*X') + rand(1,n); 

sum=0;
for i=1:n
    sum=sum+(Y(i)-b-a*X(i))^2;
end
J=vpa(sqrt((1/n)*sum),4);
disp(J);
fsurf(J,[-15 15 -15 15],'MeshDensity',30)
camlight
title('Graph of Cost Function Vs Parameters','Interpreter','Latex');
xlabel('$\beta_0$','Interpreter','Latex');
ylabel('$\beta_1$','Interpreter','Latex');
zlabel('$Cost Function$','Interpreter','Latex');
% [x,y] = meshgrid(5:0.5:10,5:.5:10);
% % % Z=symfun(J, [a b]);
% % Z = subs(J,a,x);
% % Z = subs(Z,b,y);
% % size(x)
% % size(y)
% % size(Z)
% % % disp(Z);
% Z = matlabFunction(J, 'vars', [a,b]);
% surf(x,y,Z)
%% when slope is positive
clc;
clear;
syms x;
xt = @(t) t;
yt = @(t) (1/8)*t^2;
fplot(xt,yt,[-7,7],'LineWidth',2)
f=x^2/8;
f_x = diff(f,x);
x1=4;
slop = subs(f_x,x,x1);
% y - y1 = slop(x-x1)
y1 = subs(f,x,x1);
tang = y1+slop*(x-x1);
% ezplot(f,[-5,5,0,30]);

hold on;
plot(x1,y1,'ro','LineWidth',2);
fplot(tang,'--r',[3,7],'LineWidth',2)
xlabel('$\leftarrow \beta$','Interpreter','Latex','fontweight','bold','fontsize',16)
%% when slope in negative
clc;
clear;
syms x;
xt = @(t) t;
yt = @(t) (1/8)*t^2;
fplot(xt,yt,[-7,7],'LineWidth',2)
f=x^2/8;
f_x = diff(f,x);
x1=-4;
slop = subs(f_x,x,x1);
% y - y1 = slop(x-x1)
y1 = subs(f,x,x1);
tang = y1+slop*(x-x1);
% ezplot(f,[-5,5,0,30]);

hold on;
plot(x1,y1,'ro','LineWidth',2);
fplot(tang,'--r',[-7,-3],'LineWidth',2)
xlabel('$\rightarrow \beta$','Interpreter','Latex','fontweight','bold','fontsize',16)
