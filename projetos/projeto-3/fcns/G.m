function G = G(q,m,l,g)
    q1 = q(1);
    q2 = q(2);
    
    m1 = m(1);
    m2 = m(2);
    
    l1 = l(1);
    l2 = l(2);

    G1 = 0;
    G2 = -0.5*m2*g*l2*sin(q2);
    
    G = [G1;
        G2];
end
