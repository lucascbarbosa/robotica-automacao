%% Define model
clear all;
close all;
%         theta d  a  alpha type mdh  offset
L(1) = Link([ 0 0 0.5	0	0], 'standard');
L(2) = Link([ 0 0 0.5	0	0], 'standard');
L(3) = Link([ 0 0 0.5	0	0], 'standard');

qz = [0 0 0]; % zero angles, L shaped pose
q0 = [pi -pi/2 -pi/2];

planar = SerialLink(L,'name','');
