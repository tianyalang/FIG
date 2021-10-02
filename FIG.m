classdef FIG
%类, 绘图宽度字体统一设置, 图片导出 pdf
%----------------------------------
% 类属性
%   'color': 自定义颜色表, 已预定义8种颜色, 低版本 Matlab 用此画图更美观
% 使用方法: plot(x,y,'color',FIG.color(n,:))
% 其中 n=1:8
%----------------------------------
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
%----------------------------------
% 类方法2--保存图片为 pdf 格式到系统桌面
%   FIG.savepdf(fig, filename)
% fig: 图片句柄
% filename(可选参数): 保存文件名字符串，默认为 'MySavedFile'

    properties(Constant)
        % 自定义颜色表，比原始颜色更好看
        color =[0    0.4470    0.7410
                0.8500    0.3250    0.0980
                0.9290    0.6940    0.1250
                0.4940    0.1840    0.5560
                0.4660    0.6740    0.1880
                0.3010    0.7450    0.9330
                0.6350    0.0780    0.1840
                0.5020    0.5020    0.5020];  % 灰色
    end
    
    methods(Static)
        function figSetting(fig, varargin)

            fig.Units = 'centimeters';

            % set default value
            p = inputParser();
            p.addOptional('width', 8, @isscalar);
            p.addOptional('ratio', 0.75, @isscalar);
            p.addParameter('FontSize', 10.5);
            p.addParameter('FontSizeIn', 10.5); % 图内(legend/text)字号
            p.addParameter('Journal', '');
            p.addParameter('Interpreter', 'tex', @ischar);
            p.parse(varargin{:});

            switch p.Results.Journal
                case 'acess'
                    font_size = 8;
                    fzinfig = 8;
                    w = 8.5;
                    ft = 'Times';
                case 'mythesis'
                    font_size = 10.5;
                    fzinfig = 10.5;
                    w = 8;
                    ft = 'Times New Roman';
                otherwise
                    font_size = p.Results.FontSize;
                    fzinfig = p.Results.FontSizeIn;
                    w = p.Results.width;
                    ft = 'Times New Roman';
            end
            
            fig.Position = [10 5 w w*p.Results.ratio];  % 后两位为 width, height

            set(findobj(fig, 'Type', 'axes'),...
                'FontName',ft,'FontSize',font_size,...
                'FontSizeMode','manual','LabelFontSizeMultiplier',1,...
                'LineWidth',1,...    
                'XGrid', 'on', 'YGrid', 'on', 'Box', 'on',...
                'GridLineStyle', '--','GridAlpha', 0.3,...
                'Color', 'none');
            set(findobj(fig, 'Type', 'legend'),...
                'Interpreter',p.Results.Interpreter,...
                'Visible', 'on', 'Box', 'on','Color', [1 1 1],...
                'LineWidth',0.5,'Location', 'best', 'FontName',ft,'FontSize', fzinfig);
            set(findobj(fig, 'Type', 'text'),...
                'FontSize',fzinfig, 'FontName',ft,...
                'LineStyle','none', 'HorizontalAlignment','center',...
                'Interpreter',p.Results.Interpreter);
            % annotation object need to use findall
            set(findall(fig, 'Type', 'arrowshape'),...
                'LineWidth',0.5,...
                'HeadWidth',6, 'HeadLength',6, 'HeadStyle','vback3');
            set(findall(fig, 'Type', 'textarrow'),...
                'Interpreter',p.Results.Interpreter,...
                'FontSize',font_size,'FontName',ft,'LineWidth',0.5,...
                'HeadWidth',6, 'HeadLength',6, 'HeadStyle','vback3');
        end

        function savepdf(fig, varargin)
            % 保存 figure 对象为同尺寸的pdf
            fig.PaperPositionMode = 'auto';
            fig_pos = fig.PaperPosition;
            fig.PaperSize = [fig_pos(3) fig_pos(4)];
            % 打印背景颜色设定为透明
            fig.InvertHardcopy = 'off';
            fig.Color = 'none';

            if nargin < 2
                filename = 'MySavedFile';
            else
                filename = varargin{1};
            end

            filepath = [getenv('UserProfile'), '\Desktop\']; % 自动查找桌面路径

            print(fig, [filepath, filename], '-dpdf')
        end
        
        function out = text(str, language)
            % 特定字符串自动解析成用于绘图标签的字符串
            % 按照中英文条件作不同解析
            % 解决中文字符串显示问题
            % 特定物理量自动添加英文单位
            
            if nargin < 2
                language = 'ch'; % Chinese
            end
            
            switch str
                case 'A'
                    sch = '\fontname{Monosaced}矢量磁位 \fontname{Times New Roman}A (T\cdot m)';
                    sen = 'Magnetic vector potential (T\cdot m)';
                case 'B'
                    sch = '\fontname{Monosaced}磁通密度 \fontname{Times New Roman}B (T)';
                    sen = 'Flux density (T)';
                case 'Br'
                    sch = '\fontname{Monosaced}径向磁通密度 \fontname{Times New Roman}Br (T)';
                    sen = 'Radial flux density (T)';
                case 'Bt'
                    sch = '\fontname{Monosaced}周向磁通密度 \fontname{Times New Roman}B_\theta (T)';
                    sen = 'Tangential flux density (T)';
                case 'H'
                    sch = '\fontname{Monosaced}磁场强度 \fontname{Times New Roman}H (A/m)';
                    sen = 'Magnetic field strength (A/m)';
                case 'Ht'
                    sch = '\fontname{Monosaced}切向磁场强度 \fontname{Times New Roman}Ht (A/m)';
                    sen = 'Tangential magnetic field strength (A/m)';
                case 'I'
                    sch = '\fontname{Monosaced}励磁电流 \fontname{Times New Roman}I (A)';
                    sen = 'Current (A)';
                case 'Theta'
                    sch = '\fontname{Monosaced}机械角 (度)';
                    sen = 'Position (Mech. Deg.)';
                case 'RotorTheta'
                    sch = '\fontname{Monosaced}转子位置角 {\fontname{Times New Roman}\theta\fontsize{8} r} (度)';
                    sen = 'Rotor Position (Mech. Deg.)';
                case 'FEM'
                    sch = '\fontname{Monosaced}有限元';
                    sen = 'FEM';        
                case 'Analytical'
                    sch = '\fontname{Monosaced}子域法';
                    sen = 'Analytical';
                case 'Measured'
                    sch = '\fontname{Monosaced}实测值';
                    sen = 'Measured';
                case 'EnAnalytical'
                    sch = '\fontname{Monosaced}改进子域法';
                    sen = 'Analytical Enhanced';
                case 'tan'
                    sch = '\fontname{Monosaced}周向';
                    sen = 'Tangential';
                case 'rad'
                    sch = '\fontname{Monosaced}径向';
                    sen = 'Radial';
                case 'Psi'
                    sch = '\fontname{Monosaced}磁链 \fontname{Times New Roman} \psi (Wb)';
                    sen = 'Flux Linkage (Wb)';
                case 'L'
                    sch = '\fontname{Monosaced}电感 \fontname{Times New Roman}L (H)';
                    sen = 'Inductance (H)';
                case 'Te'
                    sch = '\fontname{Monosaced}电磁转矩 \fontname{Times New Roman}Te (N\cdot m)';
                    sen = 'Electromagnetic torque (N\cdot m)';
                case 'Drop'
                    sch = '\fontname{Monosaced}磁压降 (安匝)';
                case 'Distance'
                    sch = '\fontname{Monosaced}距离 \fontname{Times New Roman} (m)';
                otherwise
                    sch = ['\fontname{Monosaced}', str];
                    sen = str;
            end
            
            switch language
                case {1, 'ch'}
                    out = sch;
                case {2,'eg','en','english'}
                    out = sen;
            end
        end
        
    end
end