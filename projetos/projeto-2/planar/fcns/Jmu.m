function Jmu = Jmu(J,Jpinv,q)
    K0 = 1;
    mu = (-K0/(3*pi^2))*[q(1)/16 q(2) q(3)+pi]';
    J = J(1:2,1:3);
    J = (eye(3,3) - Jpinv*J);
    Jmu = J*mu;
