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
        'LineStyle','none',...
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