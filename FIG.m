classdef FIG
%��, ��ͼ�������ͳһ����, ͼƬ���� pdf
%----------------------------------
% ������
%   'color': �Զ�����ɫ��, ��Ԥ����8����ɫ, �Ͱ汾 Matlab �ô˻�ͼ������
% ʹ�÷���: plot(x,y,'color',FIG.color(n,:))
% ���� n=1:8
%----------------------------------
% �෽��1--����ͼƬ�Ŀ�ȡ���߱ȡ����ִ�С��
%   FIG.figSetting(fig, width, ratio, 'FontSize', 10, 'FontSizeIn',10, 'Journal', 'acess', 'Interpreter', 'latex')
% ��ѡ����
%   fig: ͼƬ���, ��ǰͼƬ���� gcf ����
% ��ѡ����
%   width: ͼ����/cm��Ĭ�� 8
%   ratio: ͼ��߿�ȣ�Ĭ�� 0.75, ��Ĭ�ϸ߶� 6cm
% ��ѡ name-value ����
%   'FontSize': �������ע�����ֺŴ�С��Ĭ��10.5/���
%   'FontSizeIn': ͼ�������ֺŴ�С��Ĭ��10.5/���
%   'Journal': �����ڿ�������ǰ�����ͼƬ�ߴ硢ͼƬ���ֵ������ֺţ�Ŀǰֻ������'acess','mythesis'
%   'Interpreter'����������Ĭ�� 'tex', �нϸ�����ѧ���ʽʱ������ 'latex'
%----------------------------------
% �෽��2--����ͼƬΪ pdf ��ʽ��ϵͳ����
%   FIG.savepdf(fig, filename)
% fig: ͼƬ���
% filename(��ѡ����): �����ļ����ַ�����Ĭ��Ϊ 'MySavedFile'

    properties(Constant)
        % �Զ�����ɫ����ԭʼ��ɫ���ÿ�
        color =[0    0.4470    0.7410
                0.8500    0.3250    0.0980
                0.9290    0.6940    0.1250
                0.4940    0.1840    0.5560
                0.4660    0.6740    0.1880
                0.3010    0.7450    0.9330
                0.6350    0.0780    0.1840
                0.5020    0.5020    0.5020];  % ��ɫ
    end
    
    methods(Static)
        function figSetting(fig, varargin)

            fig.Units = 'centimeters';

            % set default value
            p = inputParser();
            p.addOptional('width', 8, @isscalar);
            p.addOptional('ratio', 0.75, @isscalar);
            p.addParameter('FontSize', 10.5);
            p.addParameter('FontSizeIn', 10.5); % ͼ��(legend/text)�ֺ�
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
            
            fig.Position = [10 5 w w*p.Results.ratio];  % ����λΪ width, height

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
            % ���� figure ����Ϊͬ�ߴ��pdf
            fig.PaperPositionMode = 'auto';
            fig_pos = fig.PaperPosition;
            fig.PaperSize = [fig_pos(3) fig_pos(4)];
            % ��ӡ������ɫ�趨Ϊ͸��
            fig.InvertHardcopy = 'off';
            fig.Color = 'none';

            if nargin < 2
                filename = 'MySavedFile';
            else
                filename = varargin{1};
            end

            filepath = [getenv('UserProfile'), '\Desktop\']; % �Զ���������·��

            print(fig, [filepath, filename], '-dpdf')
        end
        
        function out = text(str, language)
            % �ض��ַ����Զ����������ڻ�ͼ��ǩ���ַ���
            % ������Ӣ����������ͬ����
            % ��������ַ�����ʾ����
            % �ض��������Զ����Ӣ�ĵ�λ
            
            if nargin < 2
                language = 'ch'; % Chinese
            end
            
            switch str
                case 'A'
                    sch = '\fontname{Monosaced}ʸ����λ \fontname{Times New Roman}A (T\cdot m)';
                    sen = 'Magnetic vector potential (T\cdot m)';
                case 'B'
                    sch = '\fontname{Monosaced}��ͨ�ܶ� \fontname{Times New Roman}B (T)';
                    sen = 'Flux density (T)';
                case 'Br'
                    sch = '\fontname{Monosaced}�����ͨ�ܶ� \fontname{Times New Roman}Br (T)';
                    sen = 'Radial flux density (T)';
                case 'Bt'
                    sch = '\fontname{Monosaced}�����ͨ�ܶ� \fontname{Times New Roman}B_\theta (T)';
                    sen = 'Tangential flux density (T)';
                case 'H'
                    sch = '\fontname{Monosaced}�ų�ǿ�� \fontname{Times New Roman}H (A/m)';
                    sen = 'Magnetic field strength (A/m)';
                case 'Ht'
                    sch = '\fontname{Monosaced}����ų�ǿ�� \fontname{Times New Roman}Ht (A/m)';
                    sen = 'Tangential magnetic field strength (A/m)';
                case 'I'
                    sch = '\fontname{Monosaced}���ŵ��� \fontname{Times New Roman}I (A)';
                    sen = 'Current (A)';
                case 'Theta'
                    sch = '\fontname{Monosaced}��е�� (��)';
                    sen = 'Position (Mech. Deg.)';
                case 'RotorTheta'
                    sch = '\fontname{Monosaced}ת��λ�ý� {\fontname{Times New Roman}\theta\fontsize{8} r} (��)';
                    sen = 'Rotor Position (Mech. Deg.)';
                case 'FEM'
                    sch = '\fontname{Monosaced}����Ԫ';
                    sen = 'FEM';        
                case 'Analytical'
                    sch = '\fontname{Monosaced}����';
                    sen = 'Analytical';
                case 'Measured'
                    sch = '\fontname{Monosaced}ʵ��ֵ';
                    sen = 'Measured';
                case 'EnAnalytical'
                    sch = '\fontname{Monosaced}�Ľ�����';
                    sen = 'Analytical Enhanced';
                case 'tan'
                    sch = '\fontname{Monosaced}����';
                    sen = 'Tangential';
                case 'rad'
                    sch = '\fontname{Monosaced}����';
                    sen = 'Radial';
                case 'Psi'
                    sch = '\fontname{Monosaced}���� \fontname{Times New Roman} \psi (Wb)';
                    sen = 'Flux Linkage (Wb)';
                case 'L'
                    sch = '\fontname{Monosaced}��� \fontname{Times New Roman}L (H)';
                    sen = 'Inductance (H)';
                case 'Te'
                    sch = '\fontname{Monosaced}���ת�� \fontname{Times New Roman}Te (N\cdot m)';
                    sen = 'Electromagnetic torque (N\cdot m)';
                case 'Drop'
                    sch = '\fontname{Monosaced}��ѹ�� (����)';
                case 'Distance'
                    sch = '\fontname{Monosaced}���� \fontname{Times New Roman} (m)';
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