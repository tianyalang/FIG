function figSetting(fig, varargin)

    fig.Units = 'centimeters';

    % set default value
    p = inputParser();
    p.addOptional('width', 8, @isscalar);
    p.addOptional('ratio', 0.75, @isscalar);
    p.addParameter('FontSize', 10.5);
    p.addParameter('FontSizeIn', 10);   % 图内(legend/text)字号
    p.addParameter('Journal', '');
    p.parse(varargin{:});

    switch p.Results.Journal
        case 'acess'
            font_size = 8;
            fzinfig = 8;
            w = 8.5;
            fteg = 'Times';
        case 'mythesis'
            font_size = 10.5;           % 10.5 = 五号
            fzinfig = 10.5;
            w = 8;
            fteg = 'Times New Roman';   % 系统原始默认字体为 Helvetica
            ftch = 'SimSun';            % chinese fontname
        otherwise
            font_size = p.Results.FontSize;
            fzinfig = p.Results.FontSizeIn;
            w = p.Results.width;
            fteg = 'Times New Roman';   % english fontname
            ftch = 'SimSun';            % chinese fontname
    end

    % 图片显示位置
    fig.Position = [10 5 w w*p.Results.ratio];  % 后两位为 width, height

    set(findobj(fig, 'Type', 'axes'),...
        'FontName',fteg,'FontSize',font_size,...  
        'FontSizeMode','manual','LabelFontSizeMultiplier',1,... % axis label font size
        'LineWidth',1,'SortMethod','childorder',...  % 渲染顺序   
        'XGrid', 'on', 'YGrid', 'on', 'Box', 'on',...
        'GridLineStyle', '--','GridAlpha', 0.3,...
        'Color', 'none');
    set(findobj(fig, 'Type', 'line'), 'LineWidth', 1);
    set(findobj(fig, 'Type', 'legend'),...
        'Visible', 'on', 'Box', 'on','Color', [1 1 1],...
        'LineWidth',0.5,'Location', 'best', 'FontSize', fzinfig);

    set(findobj(fig, 'Type', 'text'),...
        'FontSize', fzinfig, 'HorizontalAlignment', 'center');
    
    %=========setting font name & interpreter===========
    h = findall(fig, '-property', 'String'); % all text,legend, label object
    for i = 1:length(h)
        if iscell(h(i).String) % 多段字符串组成的cell
            ss = h(i).String{1};
        else
            ss = h(i).String;
        end

        if max(abs(ss)) < 300 %！ 不可统一设置，中文论文中也英文标注 
            h(i).FontName = fteg;
        else
            h(i).FontName = ftch;
        end

        if ~isempty(ss) && contains(ss(1), '$') % 包含 $ 符号，则用 latex 解析
            h(i).Interpreter = 'latex';
        end
        
    end

    % annotation object need to use findall
    set(findall(fig, 'Type', 'arrowshape'),...
        'HeadWidth',5, 'HeadLength',6, 'HeadStyle','vback3');
    set(findall(fig, 'Type', 'textarrow'),...
        'FontSize',font_size,'FontName',fteg,'LineWidth',0.5,...
        'HeadWidth',5, 'HeadLength',5, 'HeadStyle','vback2');
end