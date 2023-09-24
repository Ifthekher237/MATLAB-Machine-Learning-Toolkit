fileName = 'untitled'; %your FILE NAME as string
A = imread(fileName,'png');
set(gcf,'visible','off'); % suppress figure
image(A);
axis image;                  % resolution based on image
axis on;                    %Avoid printing axis(if off)
set(gca,'LooseInset',get(gca,'TightInset')); % removing extra white space
saveas(gcf,fileName,'epsc');                % save as COLOR eps file


