clear
close all


x = 0:0.1:10;
y = sin(x);
z = cos(x);
plot(x, [y; z])

title({'��������';'$x=y^2$'}) %todo bug
xlabel('x=y^2')
ylabel('$x^3=y_2$')
legend('$y=\sin(x)$', 'z=cos(x)') %fixed, $ֻ�з��ڵ�һ�����ʽ�����ܽ�������

text(4, 0.5, '������xee')
annotation('arrow')

%%
% FIG.figSetting(gcf, 12, 0.5)