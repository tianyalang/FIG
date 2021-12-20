classdef FIG
%��, ��ͼ�������ͳһ����, ͼƬ���� pdf
% ----------------------------------
% ������
%   'color': �Զ�����ɫ��, ��Ԥ����8����ɫ, �Ͱ汾 Matlab �ô˻�ͼ������
% ʹ�÷���: plot(x,y,'color',FIG.color(n,:))
% ���� n=1:8
% ----------------------------------
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
% ----------------------------------
% �෽��2--����ͼƬΪ pdf ��ʽ��ϵͳ����
%   FIG.savepdf(fig, filename)
% fig: ͼƬ���
% filename(��ѡ����): �����ļ����ַ�����Ĭ��Ϊ 'MySavedFile'

    properties(Constant)
        % matlab�°���ɫ�������죬�ȣ��ϣ��̣��࣬��
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