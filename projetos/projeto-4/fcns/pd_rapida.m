function pd = pd_rapida(t)
qd = [(-0.75*cos(pi*t))-0.75; (-0.75*cos(pi*t))+3.75];

qddot = [0.75*pi*sin(pi*t); 0.75*pi*sin(pi*t)];

qdddot = [0.75*pi^2*cos(pi*t); 0.75*pi^2*cos(pi*t)];

pd = [qd;qddot;qdddot];