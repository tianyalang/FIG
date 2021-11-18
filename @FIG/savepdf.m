function savepdf(fig, filename, filepath)
%保存 figure 对象为同尺寸的 pdf
% fig: 图形句柄, 必选参数
% filename: 文件名, 可选，默认 MySavedFile
% filepath: 保存路径，可选，默认系统桌面

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
    fig.InvertHardcopy = 'off'; % turn off change background color to white
    fig.Color = 'none'; % appears black on screen, but transparent if printed
   
    print(fig, [filepath, filename], '-dpdf')
end