function G = G(q,mm,ml,l,a1,g)
    ml1 = ml(1);
    ml2 = ml(2);
    
    mm1 = mm(1);
    mm2 = mm(2);
    
    l1 = l(1);
    l2 = l(2);
    
    G1 = mm1*l1 + mm2*a1 + ml2*a1*g*cos(q(1)) + ml2*l2*g*cos(q(1)+q(2));
    G2 = ml2*l2*g*cos(q(1) + q(2));
    
    G = [G1;
         G2
        ];
end
