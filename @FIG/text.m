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
            sch = '\fontname{SimSun}矢量磁位\fontname{Times New Roman}{\it A} (T\cdot m)';
            sen = 'Magnetic vector potential (T\cdot m)';
        case 'B'
            sch = '\fontname{SimSun}磁通密度\fontname{Times New Roman}{\it B} (T)';
            sen = 'Flux density (T)';
        case 'Br'
            sch = '\fontname{SimSun}径向磁通密度\fontname{Times New Roman}{\it B}{\fontsize{8}r} (T)';
            sen = 'Radial flux density (T)';
        case 'Bt'
            sch = '\fontname{SimSun}周向磁通密度\fontname{Times New Roman}{\it B}{\fontsize{6}\theta} (T)';
            sen = 'Tangential flux density (T)';
        case 'H'
            sch = '\fontname{SimSun}磁场强度\fontname{Times New Roman}{\it H} (A/m)';
            sen = 'Magnetic field strength (A/m)';
        case 'Ht'
            sch = '\fontname{SimSun}切向磁场强度\fontname{Times New Roman}{\it H}{\fontsize{8}t} (A/m)';
            sen = 'Tangential magnetic field strength (A/m)';
        case 'I'
            sch = '\fontname{SimSun}励磁电流\fontname{Times New Roman}{\it I} (A)';
            sen = 'Current (A)';
        case 'Theta'
            sch = '\fontname{SimSun}位置{\fontname{Times New Roman} \theta (\circ)}';
            sen = 'Position (Mech. Deg.)';
        case 'RotorTheta'
            sch = '\fontname{SimSun}转子位置角 {\fontname{Times New Roman}\theta\fontsize{8} r} (度)';
            sen = 'Rotor Position (Mech. Deg.)';
        case 'FEM'
            sch = '有限元';
            sen = 'FEM'; 
        case 'CM'
            sch = '保角变换';
            sen = 'Conformal Mapping';
        case 'Analytical'
            sch = '子域法';
            sen = 'Analytical';
        case 'Measured'
            sch = '实测值';
            sen = 'Measured';
        case 'EnAnalytical'
            sch = '改进子域法';
            sen = 'Analytical Enhanced';
        case 'tan'
            sch = '周向';
            sen = 'Tangential';
        case 'rad'
            sch = '径向';
            sen = 'Radial';
        case 'Psi'
            sch = '\fontname{SimSun}磁链 \fontname{Times New Roman}\psi (Wb)';
            sen = 'Flux Linkage (Wb)';
        case 'L'
            sch = '\fontname{SimSun}自感\fontname{Times New Roman}{\it L} (H)';
            sen = 'Inductance (H)';
        case 'M'
            sch = '\fontname{SimSun}互感\fontname{Times New Roman}{\it M} (mH)';
            sen = 'Inductance (H)';
        case 'Te'
            sch = '\fontname{SimSun}电磁转矩\fontname{Times New Roman}{\it T{\rm\fontsize{8}e}} (N\cdot m)';
            sen = 'Electromagnetic torque (N\cdot m)';
        case 'Drop'
            sch = '\fontname{SimSun}磁压降\fontname{Times New Roman}{\it u} (A)';
        case 'Distance'
            sch = '\fontname{SimSun}距离\fontname{Times New Roman} (m)';
        case 'HA'
            sch = '\fontname{SimSun}谐波幅值\fontname{Times New Roman} (T)';
            sen = 'Harmonic Amplitude (T)';
        case 'HO'
            sch = '谐波阶次';
            sen = 'Harmonic Order';
    end
    
    switch language
        case {1, 'ch'}
            out = sch;
        case {2,'eg','en','english'}
            out = sen;
    end
end