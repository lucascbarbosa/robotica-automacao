clear all;
close all;
a = [0;0;0;0;0;0;0];
alpha = [pi/2;pi/2;pi/2;pi/2;pi/2;pi/2;pi];
d = [0;0;-0.4208;0;-0.3143;0;0];
theta = [0;0;0;0;0;0;0];
offset = [0;pi;pi;pi;pi;pi;pi];
%            theta    d           a      alpha  type mdh  offset
for i=1:7
    L(i) = Link([theta(i) d(i) a(i) alpha(i) 0 offset(i)],'standard');
end
kinova = SerialLink(L,'name',' ');

q0 = [0 0 0 pi/2 0 0 0];
qhome = [0 15 180 230 0 55 90]*pi/180;
K = 1;

run('K_opt.m')
switch_xd = 0;