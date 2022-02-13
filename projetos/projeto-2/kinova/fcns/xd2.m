function xd2  = xd2(t)
wn=2*pi/10;

xd= [0.456+0.075*cos(wn*t) 0.075*(sin(wn*t)+cos(wn*t)) 0.2+0.075*sin(wn*t)]';
xddot= [-0.075*wn*cos(wn*t) -0.075*wn*(cos(wn*t)+sin(wn*t)) 0.075*wn*cos(wn*t) ]';

xd2=[xd;xddot];

