%--------------------------------------------------------------------------
% AMTH 430
% Tikhonov
% Dr Md Rakib Hossain 30 March 2022
%--------------------------------------------------------------------------

clc;
close;
clear;

%--------------------------------------------------------------------------

% The Hilbert matrix is a notable example of a poorly conditioned matrix.
% The elements of the Hilbert matrices are H(i,j) = 1/(i + j – 1).
% A     =   hilb(10);                                 % Create a Hilbert matrix
% if Hilbert matrix is used, the code gives worng answer. Insted, we use a
% self defined random matrix.
A = rand(10,10) + 50;
% In the following, taking some exact beta values and calculting its corre-
% sponding exact y values.
x_true =[20 44 32 99 12 15 19 17 14 25]';           % Exact beta values
B_true = A*x_true;                                  % Ax=B, computing B here.

%--------------------------------------------------------------------------
%- add perturbation and compute error

% B_perturb = B_true;
B_perturb = B_true + .5;                        % adding noise in the output(B)

% Compute least square solutions and error

x_lls = (A'*A ) \ (A'*B_true);
x_perturb_lls  = (A'*A ) \ (A'* B_perturb);      % "\", not "/"

error1 = norm(x_true-x_lls)/norm(x_true);
error2 = norm(x_true-x_perturb_lls)/norm(x_true);

%--------------------------------------------------------------------------
%-add perturbation and compute error

figure(1)
plot(1:length(x_true),log10(x_true),'db','LineWidth',3)
xlabel('Data indices')
ylabel('log of data values')
hold on
plot(1:length(x_true),log10(x_perturb_lls),'*r','LineWidth',1)
legend('true data values','least square estimate','Location','northwest')
set(gca,'Fontsize',12)                                % see the documentation of gca, very easy to understand.
latex_fig(12,5,3)                                     % to use latex_fig command, firstly we have to download the latex_fig.m file
%%
%--------------------------------------------------------------------------
%-- Tikhonov Regularization
%--------------------------------------------------------------------------

lambda  = linspace(0,.5,50);    % regularization parameter
error_regu  = zeros(1,50);
for i = 1:length(lambda)
    x_regu = (A'*A + lambda(i)*eye(size(A,1)) ) \ (A* B_perturb);   % "\", not "/"
    error_regu(i) = norm(x_true-x_regu);
end

%--------------------------------------------------------------------------
% visulize error for different regularization parameter
figure(2)
plot(lambda,log10(error_regu),'linewidth',2)
xlabel('Regularization pearmeter $\lambda$','Interpreter','Latex')
ylabel('error ($\ell_2$-norm)','Interpreter','Latex')
%%

%--------------------------------------------------------------------------
%-- choose lambda = 0.0102
%--------------------------------------------------------------------------

lam = 0.0102;
x_regu = (A'*A + lam*eye(size(A,1)) ) \ (A*B_perturb);
%--------------------------------------------------------------------------
% visualize data with and without regularization and compare with true data
% values

figure(3)
plot(1:length(x_true),log10(x_true),'db','LineWidth',3)
xlabel('Data indices')
ylabel('log of data values')
hold on
plot(1:length(x_true),log10(x_perturb_lls),'*r','LineWidth',1)
plot(1:length(x_true),log10(x_regu),'ok','LineWidth',3)
legend('true data values','least square estimate',...
    'least square estimate with regularization','Location','northwest')
set(gca,'Fontsize',12)
latex_fig(12,5,3)

%-------------------------------------------------------------------------