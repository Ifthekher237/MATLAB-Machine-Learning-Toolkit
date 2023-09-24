clc;
clear;
% x=rand(100,1);
% y=3.3+.5*x + 1e-1*rand(100,1);


x = rand(50,1);
% y = 3.3 + 5.05*x; % with beta0 = 3.3 and beta1 = 5.05, in this data-set, no noise is added
y=3.3 + 5.05*x + rand(50,1);


scatter(x,y);
hold on;
cc=corrcoef(x,y);  %correlation coefficient
disp('correlation coefficient');
disp(cc(1,2));
%%
beta1=((x-mean(x))'*(y-mean(y)))/((x-mean(x))'*(x-mean(x)));
beta0=mean(y)-beta1*mean(x);
disp('beta1');
disp(beta1);
disp('beta0');
disp(beta0);
predict=beta0+beta1*x;
%%
err=norm(y-predict,2);
disp('Error of the model');
disp(err);
disp('since correlation coefficient is close to 1 which means the x and y datas are strongly correlated and we also see that our model is predicting very well with less error(almost 3%)')
%%
%relative l2 norm
rel_l2_norm=err/norm(y,2);
disp('relative l2 norm');
disp(rel_l2_norm);
%%
plot(x,predict,'LineWidth',2);
xlabel('x','FontSize',15,'FontWeight','bold','Color','k','Interpreter','Latex');
ylabel('y','FontSize',15,'FontWeight','bold','Color','k','Interpreter','Latex');
legend('Data points','Line of Regression','Location','northwest');


l2_norm = norm(y-predict,2);
disp('l2 norm of the data set');
disp(l2_norm);
l_inf_norm = norm(y-predict,'inf');
disp('l-inf norm of the data set');
disp(l_inf_norm);