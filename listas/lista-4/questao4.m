a1 = 0.5;
a2 = 0.3;
a3 = 0.2;
DH(1) = Link([0 0 a1 0]);
DH(2) = Link([0 0 a2 0]);
DH(3) = Link([0 0 a3 0]);
th1 = (-pi/3:0.05:pi/3);
th2 = (-2*pi/3:0.05:2*pi/3);
th2 = (-pi/2:0.05:pi/2);
q = {th1,th2,th3};
plotworkspace(DH,q);