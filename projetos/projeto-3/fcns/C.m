function C = C(q,qdot,m,l,d)
    q1 = q(1);
    q2 = q(2);
    
    q1dot = qdot(1);
    q2dot = qdot(2);
    
    m1 = m(1);
    m2 = m(2);
    
    l1 = l(1);
    l2 = l(2);
    
    b1 = d(1);
    r2 = d(2);
    
    C11 = 0;
    C12 = (m2*sin(2*q2)*(4*l2^2 - 3*r2^2)*q1dot)/12 + 0.5*l1*l2*m2*sin(q2)*q2dot;
    C21 = -(m2*sin(2*q2)*(4*l2^2 - 3*r2^2)*q1dot)/24 - (l1*l2*m2*sin(q2)*q2dot)/4;
    C22 = (l1*l2*m2*sin(q2)*q1dot)/4;
    
    C = [C11 C12;
        C21 C22];
end
