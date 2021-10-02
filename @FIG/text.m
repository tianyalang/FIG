function out = text(str, language)
% �ض��ַ����Զ����������ڻ�ͼ��ǩ���ַ���
% ������Ӣ����������ͬ����
% ��������ַ�����ʾ����
% �ض��������Զ����Ӣ�ĵ�λ

    if nargin < 2
        language = 'ch'; % Chinese
    end
    
    switch str
        case 'A'
            sch = '\fontname{Monosaced}ʸ����λ \fontname{Times New Roman}A (T\cdot m)';
            sen = 'Magnetic vector potential (T\cdot m)';
        case 'B'
            sch = '\fontname{Monosaced}��ͨ�ܶ� \fontname{Times New Roman}B (T)';
            sen = 'Flux density (T)';
        case 'Br'
            sch = '\fontname{Monosaced}�����ͨ�ܶ� \fontname{Times New Roman}Br (T)';
            sen = 'Radial flux density (T)';
        case 'Bt'
            sch = '\fontname{Monosaced}�����ͨ�ܶ� \fontname{Times New Roman}B_\theta (T)';
            sen = 'Tangential flux density (T)';
        case 'H'
            sch = '\fontname{Monosaced}�ų�ǿ�� \fontname{Times New Roman}H (A/m)';
            sen = 'Magnetic field strength (A/m)';
        case 'Ht'
            sch = '\fontname{Monosaced}����ų�ǿ�� \fontname{Times New Roman}Ht (A/m)';
            sen = 'Tangential magnetic field strength (A/m)';
        case 'I'
            sch = '\fontname{Monosaced}���ŵ��� \fontname{Times New Roman}I (A)';
            sen = 'Current (A)';
        case 'Theta'
            sch = '\fontname{Monosaced}��е�� (��)';
            sen = 'Position (Mech. Deg.)';
        case 'RotorTheta'
            sch = '\fontname{Monosaced}ת��λ�ý� {\fontname{Times New Roman}\theta\fontsize{8} r} (��)';
            sen = 'Rotor Position (Mech. Deg.)';
        case 'FEM'
            sch = '\fontname{Monosaced}����Ԫ';
            sen = 'FEM';        
        case 'Analytical'
            sch = '\fontname{Monosaced}����';
            sen = 'Analytical';
        case 'Measured'
            sch = '\fontname{Monosaced}ʵ��ֵ';
            sen = 'Measured';
        case 'EnAnalytical'
            sch = '\fontname{Monosaced}�Ľ�����';
            sen = 'Analytical Enhanced';
        case 'tan'
            sch = '\fontname{Monosaced}����';
            sen = 'Tangential';
        case 'rad'
            sch = '\fontname{Monosaced}����';
            sen = 'Radial';
        case 'Psi'
            sch = '\fontname{Monosaced}���� \fontname{Times New Roman} \psi (Wb)';
            sen = 'Flux Linkage (Wb)';
        case 'L'
            sch = '\fontname{Monosaced}��� \fontname{Times New Roman}L (H)';
            sen = 'Inductance (H)';
        case 'Te'
            sch = '\fontname{Monosaced}���ת�� \fontname{Times New Roman}Te (N\cdot m)';
            sen = 'Electromagnetic torque (N\cdot m)';
        case 'Drop'
            sch = '\fontname{Monosaced}��ѹ�� (����)';
        case 'Distance'
            sch = '\fontname{Monosaced}���� \fontname{Times New Roman} (m)';
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