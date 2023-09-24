clc;
clear;
x = 0:.8:15;
test_x = 0:1:15;

y = 1./(1+exp(-.5.*x)) + .1*rand(size(x));
test_y = 1./(1+exp(-.5.*test_x)) + .2*rand(size(test_x));

% disp(size(y));
% plot(x,y,'*');
% ylim([0.4 1.5])

%%
%  polyfit() returns the coefficients for a polynomial of degree n that is a best fit for the data in y. The returned coefficients are in descending powers.
[p, S, mu]=polyfit(x,y, 1);

y1 = polyval(p,x,S,mu);
figure
plot(x,y1,'b','LineWidth',2);
hold on;
plot(x,y,'ok','LineWidth',2);
hold on
plot(test_x,test_y,'dr','LineWidth',2);
hold on;
% grid on;
% grid minor;
latex_fig(13,5,4)
ylim([0.4 1.5])
legend('Regression line','Train data','Test data');

y_against_test_x = polyval(p,test_x,S,mu);

% for i=1:length(test_x)
%     plot([test_x(i) test_x(i)], [y_against_test_x(i) test_y(i)],'k','linewidth',2);
%     
% end

% legend('Data points','Regression line');
xlabel('size','Interpreter','Latex');
ylabel('price','Interpreter','Latex');
set(gca,'Fontsize',12)
hold off
%%
%  polyfit() returns the coefficients for a polynomial of degree n that is a best fit for the data in y. The returned coefficients are in descending powers.
[p, S, mu]=polyfit(x,y, 2);

y1 = polyval(p,x,S,mu);
figure
plot(x,y1,'b','LineWidth',2);
hold on;
plot(x,y,'ok','LineWidth',2);
hold on
plot(test_x,test_y,'dr','LineWidth',2);
hold on;
% grid on;
% grid minor;
latex_fig(13,5,4)
ylim([0.4 1.5])
legend('Regression line','Train data','Test data');

y_against_test_x = polyval(p,test_x,S,mu);

% for i=1:length(test_x)
%     plot([test_x(i) test_x(i)], [y_against_test_x(i) test_y(i)],'k','linewidth',2);
%     
% end

% legend('Data points','Regression line');
xlabel('size','Interpreter','Latex');
ylabel('price','Interpreter','Latex');
set(gca,'Fontsize',12)
hold off
%%
%  polyfit() returns the coefficients for a polynomial of degree n that is a best fit for the data in y. The returned coefficients are in descending powers.
[p, S, mu]=polyfit(x,y, 20);

y1 = polyval(p,x,S,mu);
figure
plot(x,y1,'b','LineWidth',2);
hold on;
plot(x,y,'ok','LineWidth',2);
hold on
plot(test_x,test_y,'dr','LineWidth',2);
hold on;
% grid on;
% grid minor;
latex_fig(13,5,4)
ylim([0.4 1.5])
legend('Regression line','Train data','Test data');

y_against_test_x = polyval(p,test_x,S,mu);

% for i=1:length(test_x)
%     
%     plot([test_x(i) test_x(i)], [test_y(i) y_against_test_x(i)],'linewidth',2);
%     
% end

xlabel('size','Interpreter','Latex');
ylabel('price','Interpreter','Latex');
set(gca,'Fontsize',12)
hold off
