function xd3  = xd3(t)
wn = pi/5;

xd = [0.456+0.075*(sin(4*wn*t)+sin(wn*t)) 0 0.2+0.075*(cos(wn*t)+cos(4*wn*t))]';
xddot = [0.075*wn*(4*cos(4*wn*t)+cos(wn*t)) 0 -0.075*wn*(sin(wn*t)+4*sin(wn*t))]';

xd3=[xd;xddot];

