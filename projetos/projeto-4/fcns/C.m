function C = C(q,qdot,ml2,a1,l2)
    h = -ml2*a1*l2*sin(q(2));
    c11 = h*qdot(2);
    c12 = h*(qdot(1) + qdot(2));
    c21 = -h*qdot(1);
    c22 = 0;
    C = [c11 c12;
        c21 c22
        ];
end
