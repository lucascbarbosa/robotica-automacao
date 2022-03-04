
function [Kp,Ki,Kd,Ka]=ppi_tuning(zeta,wn,M_)
syms s

a = 20;
deltad1 = [1 2*zeta*wn wn^2];

Kd = deltad1(2)*M_;
Ki = deltad1(3)*M_;

deltad2 = coeffs(collect((s+a)*(s^2+2*zeta*wn*s+wn^2),s));

Kp = deltad2(1)/deltad1(3);
Ka = M_;