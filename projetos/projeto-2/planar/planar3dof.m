

clear L
L(1) = link([ 0 0 0.5	0	0], 'standard');
L(2) = link([ 0 0 0.5	0	0], 'standard');
L(3) = link([ 0 0 0.5	0	0], 'standard');




%
% some useful poses
%
qz = [0 0 0]; % zero angles, L shaped pose
qr = [0 pi/2 -pi]; % ready pose, arm up
qstretch = [0 0 -pi/2];

planar = SerialLink(L);
clear L
zz.name = 'Plannar 3DOF';
zz.manuf = 'GSCAR';
