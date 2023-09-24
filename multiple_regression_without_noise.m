%This is a perfect model of multiple regression. No noise is added here.
clc ;
clear ;
X = rand(100,2);

beta1 = [1 2];
beta0 = 5;
Y = beta0 + (beta1*X');     %to match the dimensions of beta1 & X to multiply, we have to transpose the X matrix


mean_x=mean(X);

for i=1:2  
    X_without_mean(:,i) = X(:,i) - mean_x(1,i);
end

Y_without_mean = Y - mean(Y);
disp(size(Y_without_mean))
beta1 = inv(X_without_mean'*X_without_mean)*(X_without_mean'*Y_without_mean');  % to match the dimensions of X_without_mean' and Y_without_mean, we have to transpose the Y_without_mean matrix.
disp(beta1)


beta0=mean(Y) - beta1'*mean(X)';
disp(beta0)

disp('aaaa')
disp(size(X(:,1)));
disp(size(X(:,2)));
disp(size(Y));
plot3(X(:,1)',X(:,2)',Y,'or')
hold on;

[X1,X2] = meshgrid(X(:,1)',X(:,2)');
Z = beta0 + 1*X1 + 2*X2;
% disp(size(X1));
% disp(size(X2));
% disp(size(Z));
surf(X1,X2,Z,'FaceAlpha',0.5,'EdgeColor','none')
legend('data points','Regression plane')



% t = 0:pi/50:10*pi;
% st = sin(t);
% ct = cos(t);
% disp(size(t));
% disp(size(st));
% disp(size(ct));
% % figure
% % plot3(st,ct,t)



