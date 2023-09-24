clear all;
clc;
n=50;
x = 10+8*rand(n,1);
y = 20+1.5*x+5*rand(n,1);
scatter(x,y,'or')
hold on;
x1=x-mean(x);
y1=y-mean(y);
scatter(x1,y1,'ob');
hold on;
grid on;
axis([-5 20 -20 52]);
xlabel(' house-size ','Interpreter','Latex');
ylabel(' house-price ','Interpreter','Latex');

%   p1 = 1.5099;
%   p2 = 2.6142e-15;
% line = p1*x + p2 ;
% plot(x,line,'k-','linewidth',2);

% for i=1:length(x)
% plot([x(i) x(i)], [y(i) line(i)],'linewidth',2);
% 
% end
% set(gca,'XTick',[], 'YTick', [])
% legend('exact','predicted')

