clear
close all

figure(1)
t = 0:0.1:10;
for i = 1:8
    plot(t, sin(t+i/2), 'color', FIG.color(i,:), 'LineWidth',2)
    hold on
end
xlabel('FIG.color')

figure(2)
t = 0:0.1:10;
for i = 1:4
    plot(t, sin(t+i/2), 'color', FIG.color2(i,:), 'LineWidth',2)
    hold on
end
xlabel('FIG.color2')
%%
