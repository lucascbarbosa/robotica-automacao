clear J K x xd
J = kinova.jacob0(q0);
J = J(1:3,1:4);
Jpinv = pinv(J);

[R,x] = tr2rt(kinova.fkine(q0));
K2 = 100;
xd = [0.456;0;0.2];
tol = 1e-2;
K1 = 0;

while (K2-K1) > tol
    K = (K1+K2)/2;
    u = J'*K*(x-xd);
    if max(abs(u(:))) <= 3
        K1 = K;
    else
        K2 = K;
    end
end

clear K1 K2
