function savepdf(fig, filename, filepath)
%���� figure ����Ϊͬ�ߴ�� pdf
% Ĭ�ϱ�����ϵͳ����

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
    fig.InvertHardcopy = 'off';
    fig.Color = 'none';

    print(fig, [filepath, filename], '-dpdf')
end