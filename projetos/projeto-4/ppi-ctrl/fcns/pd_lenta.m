function pd = pd_lenta(t)
qd = [(-0.75*cos(pi*t/2))-0.75; (-0.75*cos(pi*t/2))+3.75];

qddot = [0.75*(pi/2)*sin(pi*t/2); 0.75*(pi/2)*sin(pi*t/2)];

qdddot = [0.75*(pi/2)^2*cos(pi*t/2); 0.75*(pi/2)^2*cos(pi*t/2)];

pd = [qd;qddot;qdddot];