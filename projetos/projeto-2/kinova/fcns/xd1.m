function xd1  = xd1(t)
wn=2*pi/10;

xd= [0.456+0.075*cos(wn*t) 0 0.2+0.075*sin(wn*t)]';
xddot= [-0.075*wn*cos(wn*t) 0 0.075*wn*cos(wn*t)]';

xd1=[xd;xddot];

