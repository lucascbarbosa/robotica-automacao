function kinova = kinova_punho_dh
    clear all;
    close all;
    a = [0;0;0;0;0;0;0];
    alpha = [-pi/2;pi/2;-pi/2;pi/2;-pi/2;pi/2;0];
    d = [0.2848;0;0.4208;0;0.3143;0;0];
    theta = [0;0;0;0;0;0;pi/2];
    offset = [0;0;0;0;0;0;0];
    %            theta    d           a      alpha  type mdh  offset
    for i=1:7
        L(i) = Link([theta(i) d(i) a(i) alpha(i) 0 offset(i)],'standard');
    end
    kinova = SerialLink(L,'name',' ');
end