% This program visualizes the error corresponding to different beta1.
% Mohammad Ifthekher Uddin Chowdhury 23rd March 2022
clc;
clear all;
x = rand(1,100);
% x = randi([0,20],1,100);               % Generate a 1-by-100 row vector of uniformly distributed random integers from the sample interval [0,20].
y_exact = 5 + 2*x + .5*rand(1,100);     %beta0=5, beta1=2
scatter(x,y_exact);
hold off;

x = x-mean(x);                          % shifting the data
y_exact = y_exact - mean(y_exact);      % shifting the data

beta1=-1:.1:5;                          %taking some beta1 values between 1 and 5 with stepsize .5
for i=1:length(beta1)
    y_pred = beta1(i)*x;                %predicted. since we have excluded mean, so we didn't add 5(beta0)
    error(i)=norm(y_exact - y_pred,2);  % cost function
end

plot(beta1,error,'ob')
xlabel('$\beta_{1}$','Interpreter','Latex')
ylabel('Error','Interpreter','Latex')

% so, we see from the plot, the beta1 value which gives the minimum error is equal to 2
% which is the beta1 value of exact model. So our program is correct.