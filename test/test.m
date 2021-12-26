clear
close all

x = 0:0.1:10;
plot(x, [sin(x); cos(x)])

title({'正弦曲线'; '余弦曲线'})     % 分行title，须用同一种解析嚣
xlabel({'$x=y^2$';'$m^3-\beta$'})  % 分行label, 须用同一种解析器
ylabel('x^3=y_2')

text(4, 0.5, '正弦线2\pix')
text(4, 0, '$$y=\int\frac{a}{b^3}$$')  % 两个$$，行间公式
annotation('arrow')

legend('$y=\sin(x)$','z=cos(x)') % fixed, $只有放在第一个表达式，才能解析出来

%%
FIG.figSetting(gcf, 12, 0.5)

% font size
a = gca;
a.FontSize
a.Title.FontSize
a.XLabel.FontSize

%%
% findobj(gcf, 'Type', 'text', '-or', 'Type', 'legend')