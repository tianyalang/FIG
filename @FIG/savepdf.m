function savepdf(fig, filename, filepath)
%保存 figure 对象为同尺寸的 pdf
% 默认保存于系统桌面

    if nargin < 3
        filepath = [getenv('UserProfile'), '\Desktop\']; % 自动查找桌面路径
        if nargin < 2
            filename = 'MySavedFile';
        end
    end

    fig.PaperPositionMode = 'auto';
    fig_pos = fig.PaperPosition;
    fig.PaperSize = [fig_pos(3) fig_pos(4)];
    % 打印背景颜色设定为透明
    fig.InvertHardcopy = 'off';
    fig.Color = 'none';

    print(fig, [filepath, filename], '-dpdf')
end