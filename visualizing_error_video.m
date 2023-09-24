clc;
clear;

x=rand(1,100);
y=3.3 + 5.5*x + 3*rand(1,100);
% scatter(x,y);

obj = VideoWriter('animation.avi');
obj.Quality = 100;
obj.FrameRate = 5;
open(obj);

beta1 = 4:0.1:12;
a = 1:size(beta1,2);
b = size(beta1,2):-1:1;     % size(beta1,2):-1:1 ==> for reverse play

% visualising error for different beta1 values and different
% regression line for different beta1 values


for i = a
    line = 3.3 + beta1(i)*x; % for different beta1 value getting the y value

    subplot(2,1,1);
    plot(x,line,'b','LineWidth',2);
    xlabel('$x$','Interpreter','Latex');
    ylabel('$y$','Interpreter','Latex');
    axis([0 1 0 15])

    error = norm (y - line,2)/norm(y,2);
    hold on;
    scatter(x,y,'r'); % every time this loop runs, the data points will be printed each time.
    hold off;   % if not hold off, then then every line from every loop will be shown.

    subplot(2,1,2);
    plot(beta1(i),error,'ok');  % plotting error for different beta1 value.
    axis([3.9 12.1 0.1 .35])
    hold on;

    f = getframe(gcf);
    writeVideo(obj,f);
    xlabel('$\beta_{1}$','Interpreter','Latex');
    ylabel('Relative error','Interpreter','Latex');
end
pause(.15);
hold off;

for i = b
    line = 3.3 + beta1(i)*x; % for different beta1 value getting the y value

    subplot(2,1,1);
    plot(x,line,'b','LineWidth',2);
    xlabel('$x$','Interpreter','Latex');
    ylabel('$y$','Interpreter','Latex');
    axis([0 1 0 15])

    error = norm (y - line,2)/norm(y,2);
    hold on;
    scatter(x,y,'r'); % every time this loop runs, the data points will be printed each time.
    hold off;   % if not hold off, then then every line from every loop will be shown.

    subplot(2,1,2);
    plot(beta1(i),error,'ok');  % plotting error for different beta1 value.
    axis([3.9 12.1 0.1 .35])
    hold on;

    f = getframe(gcf);
    writeVideo(obj,f);
    xlabel('$\beta_{1}$','Interpreter','Latex');
    ylabel('Relative error','Interpreter','Latex');
end
    



obj.close();