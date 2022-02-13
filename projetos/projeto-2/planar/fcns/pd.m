function pd  = pd(t)

xd = [0.25*(1-cos(pi*t)) 0.25*(2+sin(pi*t))]';
xddot = [0.25*pi*sin(pi*t) 0.25*pi*cos(pi*t)]';

pd=[xd;xddot];

