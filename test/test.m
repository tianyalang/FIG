clear
close all

x = 0:0.1:10;
plot(x, [sin(x); cos(x)])

title({'��������'; '��������'})     % ����title������ͬһ�ֽ�����
xlabel({'$x=y^2$';'$m^3-\beta$'})  % ����label, ����ͬһ�ֽ�����
ylabel('x^3=y_2')

text(4, 0.5, '������2\pix')
text(4, 0, '$$y=\int\frac{a}{b^3}$$')  % ����$$���м乫ʽ
annotation('arrow')

legend('$y=\sin(x)$','z=cos(x)') % fixed, $ֻ�з��ڵ�һ�����ʽ�����ܽ�������

%%
FIG.figSetting(gcf, 12, 0.5)

% font size
a = gca;
a.FontSize
a.Title.FontSize
a.XLabel.FontSize

%%
% findobj(gcf, 'Type', 'text', '-or', 'Type', 'legend')