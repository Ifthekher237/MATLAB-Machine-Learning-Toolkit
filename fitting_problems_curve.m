clc;
clear;
x=0:.8:15;

y=1./(1+exp(-.5.*x)) + .1*rand(size(x));



%%
%  polyfit() returns the coefficients for a polynomial of degree n that is a best fit for the data in y. The returned coefficients are in descending powers.
[p, S, mu]=polyfit(x,y, 1);

y1 = polyval(p,x,S,mu);
figure
plot(x,y,'o')
ylim([0.4 1.5])
hold on
plot(x,y1)
legend('Data points','Regression line');
xlabel('size','Interpreter','Latex');
ylabel('price','Interpreter','Latex');
hold off
%%
%  polyfit() returns the coefficients for a polynomial of degree n that is a best fit for the data in y. The returned coefficients are in descending powers.
[p, S, mu]=polyfit(x,y, 2);

y1 = polyval(p,x,S,mu);
figure
plot(x,y,'o')
ylim([0.4 1.5])
hold on
plot(x,y1)
legend('Data points','Regression line');
xlabel('size','Interpreter','Latex');
ylabel('price','Interpreter','Latex');
hold off
%%
%  polyfit() returns the coefficients for a polynomial of degree n that is a best fit for the data in y. The returned coefficients are in descending powers.
[p, S, mu]=polyfit(x,y, length(x)+1);

y1 = polyval(p,x,S,mu);
figure
plot(x,y,'o')
ylim([0.4 1.5])
hold on
plot(x,y1)
legend('Data points','Regression line');
xlabel('size','Interpreter','Latex');
ylabel('price','Interpreter','Latex');
hold off