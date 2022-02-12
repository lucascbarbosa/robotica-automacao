clear J K x xd
J = kinova.jacob0(q0);
J = J(1:3,1:4);
Jpinv = pinv(J);

[R,x] = tr2rt(kinova.fkine(q0));
wn = pi/5;
t = 0;
xd1 = [0.456+0.075*cos(wn*t) 0 0.2+0.075*sin(wn*t)]';
xd2 = [0.456+0.075*cos(wn*t) 0.075*(sin(wn*t)+cos(wn*t)) 0.2+0.075*sin(wn*t)]';
xd3 = [0.456+0.075*(sin(4*wn*t)+sin(wn*t)) 0 0.2+0.075*(cos(wn*t)+cos(4*wn*t))]';
xds = [xd1 xd2 xd3];

xddot1 = [-0.075*wn*cos(wn*t) 0 0.075*wn*cos(wn*t)]';
xddot2 = [-0.075*wn*cos(wn*t) -0.075*wn*(cos(wn*t)+sin(wn*t)) 0.075*wn*cos(wn*t) ]';
xddot3 = [0.075*wn*(cos(wn*t)+4*cos(4*wn*t)) 0 -0.075*wn*(sin(wn*t)+4*sin(wn*t))]';
xddots = [xddot1 xddot2 xddot3];

Ks = zeros(2,3);

for j = 1:2
    for i=1:3
        xd = xds(i);
        xddot = xddots(i);
        
        tol = 1e-2;
        K1 = 0;
        K2 = 100;
        while (K2-K1) > tol
            K = (K1+K2)/2;
            if j == 1
                u = Jpinv*(xddot+K*(xd-x));
            else
                u = J'*K*(x-xd);
            end
            if max(abs(u(:))) <= 3
                K1 = K;
            else
                K2 = K;
            end
        end
        
        Ks(j,i) = K;
    end
end
clear K1 K2 xd xds xd1 xd2 xd3 xddot xddots xddot1 xddot2 xddot3