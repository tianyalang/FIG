classdef FIG
%类, 绘图宽度字体统一设置, 图片导出 pdf
% ----------------------------------
% 类属性
%   'color': 自定义颜色表, 已预定义8种颜色, 低版本 Matlab 用此画图更美观
% 使用方法: plot(x,y,'color',FIG.color(n,:))
% 其中 n=1:8
% ----------------------------------
% 类方法1--设置图片的宽度、宽高比、文字大小等
%   FIG.figSetting(fig, width, ratio, 'FontSize', 10, 'FontSizeIn',10, 'Journal', 'acess', 'Interpreter', 'latex')
% 必选参数
%   fig: 图片句柄, 当前图片可用 gcf 传入
% 可选参数
%   width: 图像宽度/cm，默认 8
%   ratio: 图像高宽比，默认 0.75, 即默认高度 6cm
% 可选 name-value 参数
%   'FontSize': 坐标轴标注文字字号大小，默认10.5/五号
%   'FontSizeIn': 图内文字字号大小，默认10.5/五号
%   'Journal': 内置期刊名，提前定义好图片尺寸、图片文字的字体字号，目前只定义了'acess','mythesis'
%   'Interpreter'：解析器，默认 'tex', 有较复杂数学表达式时，需用 'latex'
% ----------------------------------
% 类方法2--保存图片为 pdf 格式到系统桌面
%   FIG.savepdf(fig, filename)
% fig: 图片句柄
% filename(可选参数): 保存文件名字符串，默认为 'MySavedFile'

    properties(Constant)
        % matlab新版颜色表：蓝，红，橙，紫，绿，青，棕
        color =[0         0.4470    0.7410 % blue
                0.8500    0.3250    0.0980 % red
                1         0.498     0.1529 % orange
                0.4940    0.1840    0.5560 % purple
                0.4660    0.6740    0.1880 % green
                0.3010    0.7450    0.9330 % cyan
                0.6350    0.0780    0.1840 % brown
                0.5020    0.5020    0.5020];  % gray
        
                arrowProps = {'width',0.1,'tipangle',20, 'baseangle',30, 'length',8};
    end
    
    methods(Static)
        figSetting(fig, varargin)
        savepdf(fig, filename, filepath)        
        out = text(str, language)        
    end
end