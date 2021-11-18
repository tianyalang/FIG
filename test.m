clear
close all

% t = 0:0.1:10;
% for i = 1:8
%     y = sin(t+0.5*i);
%     plot(t, y, 'color', FIG.color(i,:));
%     hold on
% end

x = 0:0.1:10;
y = sin(x);
z = cos(x);
plot(x, [y; z])

legend('y=sin(x)', '$z=cos(x)$')

FIG.figSetting(gcf)