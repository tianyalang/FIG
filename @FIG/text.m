function out = text(str, language)
% 特定字符串自动解析成用于绘图标签的字符串
% 按照中英文条件作不同解析
% 解决中文字符串显示问题
% 特定物理量自动添加英文单位

    if nargin < 2
        language = 'ch'; % Chinese
    end
    
    switch str
        case 'A'
            sch = '\fontname{Monosaced}矢量磁位 \fontname{Times New Roman}A (T\cdot m)';
            sen = 'Magnetic vector potential (T\cdot m)';
        case 'B'
            sch = '\fontname{Monosaced}磁通密度 \fontname{Times New Roman}B (T)';
            sen = 'Flux density (T)';
        case 'Br'
            sch = '\fontname{Monosaced}径向磁通密度 \fontname{Times New Roman}Br (T)';
            sen = 'Radial flux density (T)';
        case 'Bt'
            sch = '\fontname{Monosaced}周向磁通密度 \fontname{Times New Roman}B_\theta (T)';
            sen = 'Tangential flux density (T)';
        case 'H'
            sch = '\fontname{Monosaced}磁场强度 \fontname{Times New Roman}H (A/m)';
            sen = 'Magnetic field strength (A/m)';
        case 'Ht'
            sch = '\fontname{Monosaced}切向磁场强度 \fontname{Times New Roman}Ht (A/m)';
            sen = 'Tangential magnetic field strength (A/m)';
        case 'I'
            sch = '\fontname{Monosaced}励磁电流 \fontname{Times New Roman}I (A)';
            sen = 'Current (A)';
        case 'Theta'
            sch = '\fontname{Monosaced}机械角 (度)';
            sen = 'Position (Mech. Deg.)';
        case 'RotorTheta'
            sch = '\fontname{Monosaced}转子位置角 {\fontname{Times New Roman}\theta\fontsize{8} r} (度)';
            sen = 'Rotor Position (Mech. Deg.)';
        case 'FEM'
            sch = '\fontname{Monosaced}有限元';
            sen = 'FEM';        
        case 'Analytical'
            sch = '\fontname{Monosaced}子域法';
            sen = 'Analytical';
        case 'Measured'
            sch = '\fontname{Monosaced}实测值';
            sen = 'Measured';
        case 'EnAnalytical'
            sch = '\fontname{Monosaced}改进子域法';
            sen = 'Analytical Enhanced';
        case 'tan'
            sch = '\fontname{Monosaced}周向';
            sen = 'Tangential';
        case 'rad'
            sch = '\fontname{Monosaced}径向';
            sen = 'Radial';
        case 'Psi'
            sch = '\fontname{Monosaced}磁链 \fontname{Times New Roman} \psi (Wb)';
            sen = 'Flux Linkage (Wb)';
        case 'L'
            sch = '\fontname{Monosaced}电感 \fontname{Times New Roman}L (H)';
            sen = 'Inductance (H)';
        case 'Te'
            sch = '\fontname{Monosaced}电磁转矩 \fontname{Times New Roman}Te (N\cdot m)';
            sen = 'Electromagnetic torque (N\cdot m)';
        case 'Drop'
            sch = '\fontname{Monosaced}磁压降 (安匝)';
        case 'Distance'
            sch = '\fontname{Monosaced}距离 \fontname{Times New Roman} (m)';
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