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