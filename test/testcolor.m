clear
close all

t = 0:0.1:10;
for i = 1:8
    plot(t, sin(t+i/2), 'color', FIG.color(i,:))
    hold on
end