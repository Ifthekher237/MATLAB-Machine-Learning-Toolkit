%%
% carbig.mat ==>	Measurements of cars, 1970–1982
load carbig.mat
k=1;
for i=1:length(Cylinders)
    if or(isnan(Cylinders(i))==1, isnan(Displacement(i))==1)
        continue
    else
        new_acc(k) = Acceleration(i);
        new_hp(k) = Horsepower(i);
        k=k+1;
    end

end

scatter(new_hp,new_acc);
hold on;
% p1 = -0.050433;
% p2 = 20.792;
% new_acc=p1*new_hp + p2;
% plot(new_hp,new_acc)
xlim([0 260])
xlabel('Horsepower','Interpreter','Latex');
ylabel('Acceleration','Interpreter','Latex');
set(gca,'Fontsize',20)
annotation('textbox', [0.7, 0.8, 0.1, 0.1], 'String', {'$\beta_{0}=20.792$','$\beta_{1}=-0.050433$'},'Interpreter','Latex')
%%
% Example 2
load fisheriris.mat
% species ==> setosa
sepal_length_s = meas(1:50,1);
sepal_width_s = meas(1:50,2);
petal_length_s = meas(1:50,3);
petal_width_s = meas(1:50,4);

figure(1)
scatter(sepal_width_s,sepal_length_s)
% title('sepal length & sepal width of Iris setosa','Interpreter','Latex')
xlabel('sepal width','Interpreter','Latex');
ylabel('sepal length','Interpreter','Latex');
set(gca,'Fontsize',20)
annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', {'$\beta_{0}=2.639$','$\beta_{1}=0.69049$'},'Interpreter','Latex')



% %%
% % species ==> versicalor
% sepal_length_v = meas(51:100,1);
% sepal_width_v = meas(51:100,2);
% petal_length_v = meas(51:100,3);
% petal_width_v = meas(51:100,4);
% 
% figure(1)
% scatter(sepal_width_v,sepal_length_v)
% title('sepal length & sepal width of Iris Versicalor','Interpreter','Latex','Fontsize',15)
% xlabel('sepal width','Interpreter','Latex');
% ylabel('sepal length','Interpreter','Latex');
% set(gca,'Fontsize',20)
% annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', {'$\beta_{0}=3.5397$','$\beta_{1}=0.86508$'},'Interpreter','Latex')

% scatter(petal_length_v,petal_width_v)
% %%
% % species ==> verginica
% sepal_length_vg = meas(101:150,1);
% sepal_width_vg = meas(101:150,2);
% petal_length_vg = meas(101:150,3);
% petal_width_vg = meas(101:150,4);

%%
% Load the sample data. Identify weight and horsepower as predictors, and
% mileage as the response.
load carsmall
x1 = Weight;
x2 = Acceleration;    % Contains NaN data
y = Displacement;

%===================================================
% Compute the regression coefficients for a linear model with an
% interaction term.
X = [ones(size(x1)) x1 x2 x1.*x2];
b = regress(y,X)    % Removes NaN data

%====================================================
% Plot the data and the model.
% 
% scatter3(x1,x2,y,'filled')
% hold on
% x1fit = min(x1):100:max(x1);
% x2fit = min(x2):10:max(x2);
% [X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
% YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
% mesh(X1FIT,X2FIT,YFIT)
% xlabel('Weight','Interpreter','Latex')
% ylabel('Horsepower','Interpreter','Latex')
% zlabel('MPG','Interpreter','Latex')
% % view(90,10)


scatter3(x1,x2,y,'r','filled')   % plotting the data points
hold on;
%==========================================================
[X1,X2] = meshgrid(x1',x2');    % creating meshgrid to draw 3d line plot
Z = beta0 + beta1(1)*X1 + beta1(2)*X2;  % Now, using the estimeted beta values in the model

% surf(X1,X2,Z,'FaceAlpha',0.5,'EdgeColor','none')
mesh(X1,X2,Z)
xlabel('Weight','Interpreter','Latex')
ylabel('Horsepower','Interpreter','Latex')
zlabel('MPG','Interpreter','Latex')
% Create a semitransparent surface by specifying the FaceAlpha name-value
% pair with 0.5 as the value.
% legend('data points','Regression plane')

%% Example 3

T = readtable('e_commerce.xlsx');
new_t = table2array(T(:,4:8));
% plot(new_t(:,4),new_t(:,5),'.')

scatter(new_t(:,4),new_t(:,5));
hold on;

xlim([0 10])
xlabel('Length Of Membership','Interpreter','Latex');
ylabel('Yearly Amount Spent','Interpreter','Latex');
set(gca,'Fontsize',20)
annotation('textbox', [0.7, 0.25, 0.1, 0.1], 'String', {'$\beta_{0}=272.4$','$\beta_{1}=64.219$'},'Interpreter','Latex')