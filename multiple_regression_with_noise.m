%%
%This is not a perfect model because some noise is added in the data.
clc ;
clear ;
X = rand(100,2);    % creating a random matrix with 2 features

beta1 = [1 2];
beta0 = 5;
% In the following line, at the end we added some noise.The less noise, the
% more accurate the beta0 and beta1 values are (i.e. closer to 5 and [1 2])
Y = beta0 + (beta1*X') + rand(1,100);     %to match the dimensions of beta1 & X to multiply, we have to transpose the X matrix
disp(size(Y));
%=========================================================
mean_x=mean(X);
for i=1:2  
    X_without_mean(:,i) = X(:,i) - mean_x(1,i);
end
%=========================================================
Y_without_mean = Y - mean(Y);
%==========================================================
beta1 = inv(X_without_mean'*X_without_mean)*(X_without_mean'*Y_without_mean');  % to match the dimensions of X_without_mean' and Y_without_mean, we have to transpose the Y_without_mean matrix.
disp(beta1)

beta0=mean(Y) - beta1'*mean(X)';
disp(beta0)
%==========================================================
% disp(size(X(:,1)));
% disp(size(X(:,2)));
% disp(size(Y));
scatter3(X(:,1)',X(:,2)',Y,'r','filled')   % plotting the data points
hold on;
%==========================================================
[X1,X2] = meshgrid(X(:,1)',X(:,2)');    % creating meshgrid to draw 3d line plot
Z = beta0 + beta1(1)*X1 + beta1(2)*X2;  % Now, using the estimeted beta values in the model

% surf(X1,X2,Z,'FaceAlpha',0.5,'EdgeColor','none')
mesh(X1,X2,Z)
xlabel('Weight','Interpreter','Latex')
ylabel('Horsepower','Interpreter','Latex')
zlabel('MPG','Interpreter','Latex')
% Create a semitransparent surface by specifying the FaceAlpha name-value
% pair with 0.5 as the value.
% legend('data points','Regression plane')
%%
scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Weight','Interpreter','Latex')
ylabel('Horsepower','Interpreter','Latex')
zlabel('MPG','Interpreter','Latex')
% view(90,10)