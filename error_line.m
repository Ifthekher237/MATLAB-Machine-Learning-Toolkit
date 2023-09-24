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
xlabel(' Income($/Hour) ');
ylabel(' Happiness Score ');

  p1 = 1.5099;
  p2 = 2.6142e-15;
line = p1*x + p2 ;
plot(x,line,'k-','linewidth',2);

for i=1:length(x)
plot([x(i) x(i)], [y(i) line(i)],'linewidth',2);

end