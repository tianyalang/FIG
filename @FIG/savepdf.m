function savepdf(fig, filename, filepath)
%���� figure ����Ϊͬ�ߴ�� pdf
% fig: ͼ�ξ��, ��ѡ����
% filename: �ļ���, ��ѡ��Ĭ�� MySavedFile
% filepath: ����·������ѡ��Ĭ��ϵͳ����

    if nargin < 3
        filepath = [getenv('UserProfile'), '\Desktop\']; % �Զ���������·��
        if nargin < 2
            filename = 'MySavedFile';
        end
    end

    fig.PaperPositionMode = 'auto';
    fig_pos = fig.PaperPosition;
    fig.PaperSize = [fig_pos(3) fig_pos(4)];
    % ��ӡ������ɫ�趨Ϊ͸��
    fig.InvertHardcopy = 'off'; % turn off change background color to white
    fig.Color = 'none'; % appears black on screen, but transparent if printed
   
    print(fig, [filepath, filename], '-dpdf')
end