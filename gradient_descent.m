clc;
clear;
% creating random dataset with prescribed beta0 & beta1
x = rand(1,14);
y = 3.3 + 5.05*x; % with beta0 = 3.3 and beta1 = 5.05, in this data-set, no noise is added
figure(1);
scatter(x,y)

%%
% creating mesgrid for cost function
[beta,beta1] = meshgrid(-500:1:500);    %beta0 = 3.3 and beta1 = 5.05, if these values aren't included in the meshgrid range, then the curve won't be cup shaped.
for i = 1:1001
    for j=1:1001
        sum=0;
        for k=1:length(x)
            sum=sum+[beta(i,j)+beta1(i,j)*x(k)-y(k)]^2;
        end
        z(i,j)=sum/(2*length(x));
    end
end
figure(2);
mesh(beta,beta1,z);
[r c] = min(z);     % r==> smallest number in each column, c==>the row indices of the matrix in which they appear.
title('Graph of Cost Function Vs Parameters','Interpreter','Latex');
xlabel('$\beta_0$','Interpreter','Latex');
ylabel('$\beta_1$','Interpreter','Latex');
zlabel('$Cost Function$','Interpreter','Latex');

%%
% Gradient Descent algorithm
alpha = 0.01;
psi=0;
psi1=0;
for i=1:5000
    sum1=0;
    sum2=0;
    for j=1:length(x)
        sum1=sum1+2*(psi+psi1*x(j)-y(j));
        sum2=sum2+2*(psi+psi1*x(j)-y(j))*x(j);
    end
    psi=psi-alpha*sum1/length(x);
    psi1=psi1-alpha*sum2/length(x);
end
fprintf('The beta0 value is =%d',psi);
fprintf('\n\nThe beta1 value is = %d\n\n',psi1);

for i=1:length(x)
%     xnew(i)=x(i);
    ynew(i)=psi+psi1*x(i);
end
figure(3);
scatter(x,y,'x','r');hold on;       % scatter plot of exact x and exact y;
title('Graph of DATA vs PREDICTED FIT','Interpreter','Latex');
plot(x,ynew,'b');hold on;           % plot of approximated y
legend({'DATA','PREDICTED FIT'},'Interpreter','Latex');
xlabel('$x$','Interpreter','Latex');
ylabel('$y$','Interpreter','Latex');

%%
% Gradient descent algorithm(convergent history)
clc;
alpha=1;
psi=0;
psi1=0;
figure(5);
mesh(beta,beta1,z);
for i=1:30
    sum1=0;
    sum2=0;
    for j=1:length(x)
        sum1=sum1+(psi+psi1*x(j)-y(j));
        sum2=sum2+(psi+psi1*x(j)-y(j))*x(j);
    end
    psi=psi-alpha*sum1/length(x);
    psi1=psi1-alpha*sum2/length(x);
    
    hold on;
    plot(psi,psi1,'o')
    ylim([-7 7])
end

fprintf('The beta0 value is =%d',psi);
fprintf('\n\nThe beta1 value is =%d\n\n',psi1);