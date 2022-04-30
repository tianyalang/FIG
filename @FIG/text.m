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
            sch = '\fontname{SimSun}ʸ����λ\fontname{Times New Roman}{\it A} (T\cdot m)';
            sen = 'Magnetic vector potential (T\cdot m)';
        case 'B'
            sch = '\fontname{SimSun}��ͨ�ܶ�\fontname{Times New Roman}{\it B} (T)';
            sen = 'Flux density (T)';
        case 'Br'
            sch = '\fontname{SimSun}�����ͨ�ܶ�\fontname{Times New Roman}{\it B}{\fontsize{8}r} (T)';
            sen = 'Radial flux density (T)';
        case 'Bt'
            sch = '\fontname{SimSun}�����ͨ�ܶ�\fontname{Times New Roman}{\it B}{\fontsize{6}\theta} (T)';
            sen = 'Tangential flux density (T)';
        case 'H'
            sch = '\fontname{SimSun}�ų�ǿ��\fontname{Times New Roman}{\it H} (A/m)';
            sen = 'Magnetic field strength (A/m)';
        case 'Ht'
            sch = '\fontname{SimSun}����ų�ǿ��\fontname{Times New Roman}{\it H}{\fontsize{8}t} (A/m)';
            sen = 'Tangential magnetic field strength (A/m)';
        case 'I'
            sch = '\fontname{SimSun}���ŵ���\fontname{Times New Roman}{\it I} (A)';
            sen = 'Current (A)';
        case 'Theta'
            sch = '\fontname{SimSun}λ��{\fontname{Times New Roman} \theta (\circ)}';
            sen = 'Position (Mech. Deg.)';
        case 'RotorTheta'
            sch = '\fontname{SimSun}ת��λ�ý� {\fontname{Times New Roman}\theta\fontsize{8} r} (��)';
            sen = 'Rotor Position (Mech. Deg.)';
        case 'FEM'
            sch = '����Ԫ';
            sen = 'FEM'; 
        case 'CM'
            sch = '���Ǳ任';
            sen = 'Conformal Mapping';
        case 'Analytical'
            sch = '����';
            sen = 'Analytical';
        case 'Measured'
            sch = 'ʵ��ֵ';
            sen = 'Measured';
        case 'EnAnalytical'
            sch = '�Ľ�����';
            sen = 'Analytical Enhanced';
        case 'tan'
            sch = '����';
            sen = 'Tangential';
        case 'rad'
            sch = '����';
            sen = 'Radial';
        case 'Psi'
            sch = '\fontname{SimSun}���� \fontname{Times New Roman}\psi (Wb)';
            sen = 'Flux Linkage (Wb)';
        case 'L'
            sch = '\fontname{SimSun}�Ը�\fontname{Times New Roman}{\it L} (H)';
            sen = 'Inductance (H)';
        case 'M'
            sch = '\fontname{SimSun}����\fontname{Times New Roman}{\it M} (mH)';
            sen = 'Inductance (H)';
        case 'Te'
            sch = '\fontname{SimSun}���ת��\fontname{Times New Roman}{\it T{\rm\fontsize{8}e}} (N\cdot m)';
            sen = 'Electromagnetic torque (N\cdot m)';
        case 'Drop'
            sch = '\fontname{SimSun}��ѹ��\fontname{Times New Roman}{\it u} (A)';
        case 'Distance'
            sch = '\fontname{SimSun}����\fontname{Times New Roman} (m)';
        case 'HA'
            sch = '\fontname{SimSun}г����ֵ\fontname{Times New Roman} (T)';
            sen = 'Harmonic Amplitude (T)';
        case 'HO'
            sch = 'г���״�';
            sen = 'Harmonic Order';
    end
    
    switch language
        case {1, 'ch'}
            out = sch;
        case {2,'eg','en','english'}
            out = sen;
    end
end