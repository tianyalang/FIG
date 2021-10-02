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