function [T_d,T_real]=qkinova_inv(kinova)
    R = [0 0 1;1 0 0;0 1 0];
    p = [0.58 -0.2 0.4];
    T_d = rt2tr(R,p);
    q_real = kinova.ikine(T_d);
    T_real = kinova.fkine(q_real);
end