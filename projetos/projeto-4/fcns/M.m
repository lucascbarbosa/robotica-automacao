function M = M(q,ml,mm,Il,Im,Kr,a1,l)
    q1 = q(1);
    q2 = q(2);
    
    mm1 = mm(1);
    mm2 = mm(2);
    
    ml1 = ml(1);
    ml2 = ml(2);
    
    Im1 = Im(1);
    Im2 = Im(2);
    
    Il1 = Il(1);
    Il2 = Il(2);
    
    l1 = l(1);
    l2 = l(2);
    
    Kr1 = Kr(1);
    Kr2 = Kr(2);
    
    % M matrix
    b11 = Il1+ml1*l1^2+(Kr1^2)*Im1+Il2+ml2*(a1^2+l2^2+2*a1*l2*cos(q(2)))+Im2+mm2*a1^2;
    b12 = Il2 + ml2*(l2^2 +a1*l2*cos(q(2))) + Kr2*Im2;
    b22 = Il2 + ml2^2 + Kr2^2*Im2;

    M = [
        b11 b12;
        b12 b22
        ];
end
