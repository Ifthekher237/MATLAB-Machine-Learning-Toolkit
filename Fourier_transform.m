% %%
% f = 3;
% t = 0:.001:3.5;
% signal = cos(2*pi*f*t);
% signal = signal + 1; % shifting 1 unit up so that the signal always produce +ve value
% subplot(2,1,1);
% plot(t,signal);
% title(num2str(f,'Hz = %4.2f'));
% 
% subplot(2,1,2)
% for f=0:.01:3
%     r = signal;
%     theta = t*2*pi*f;
%     polarplot(theta,r);
%     title(num2str(f,'Hz = %4.2f'));
%     ax = gca;
%     ax.RTick = []; % so that, on polar plot no radus level is shown
%     pause(.015);
% end
%%
f1 = 2;
f2 = 5;
t = 0:.001:3.5;
cos_wave1 = cos(2*pi*f1*t);
cos_wave2 = cos(2*pi*f2*t);
signal = (cos_wave1 + cos_wave2) + 1; % shifting 1 unit up so that the signal always produce +ve value

% fig = figure();
% fig.Color = 'k';
subplot(2,2,[1,2]);
plot(t,signal);
% set(gca,'Color','k');
% title(num2str(f,'Hz = %4.2f'));
title('Signal')
xlabel('Time','Interpreter','Latex');
ylabel('Intensity','Interpreter','Latex');

i=1;
for f=0:.01:7   % f is the freq at which the signal is being wrapped up around the circle
    
    r = signal;
    theta = t*2*pi*f;    
%-------------------------------------------------------------------------%    
    subplot(2,2,3)
    polarplot(theta,r);
%     set(gca,'Color','k');
    title(num2str(f,'Winding freq = %4.2fHz'));
    ax = gca;
    ax.RTick = []; % so that, on polar plot no radus level is shown
    hold on
%-------------------------------------------------------------------------%     
    x_cord = r.*cos(theta);
    y_cord = r.*sin(theta);
    r_mean = sqrt((mean(x_cord))^2 + mean(y_cord)^2);
    theta_mean = atan(mean(y_cord)/mean(x_cord));
    mean_x(i) = mean(x_cord);
    mean_y(i) = mean(y_cord);
    
    polarplot(theta_mean,r_mean,'or');  % plot the center of mass of the wire on the previous plot
    hold off;
%-------------------------------------------------------------------------% 
    subplot(2,2,4)
    plot(f,mean_x(i),'.r')   % draws the x-coordinates of COM
%     set(gca,'Color','k');
    hold on;    
%-------------------------------------------------------------------------% 
    plot(f,mean_y(i),'.k')  % draws the y-coordinates of COM
%     set(gca,'Color','k');
    title('x & y coordinate of COM');
    xlabel('frequency','Interpreter','Latex');
%     legend('x-cord','y-cord')
    xlim([0 7])
    ylim([-.5 2])
    i=i+1;
    pause(.015);
end

