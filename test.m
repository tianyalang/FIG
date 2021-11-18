clear
close all


x = 0:0.1:10;
y = sin(x);
z = cos(x);
plot(x, [y; z])

title({'正弦曲线';'$x=y^2$'}) %todo bug
xlabel('x=y^2')
ylabel('$x^3=y_2$')
legend('$y=\sin(x)$', 'z=cos(x)') %fixed, $只有放在第一个表达式，才能解析出来

text(4, 0.5, '正弦线xee')
annotation('arrow')

%%
% FIG.figSetting(gcf, 12, 0.5)