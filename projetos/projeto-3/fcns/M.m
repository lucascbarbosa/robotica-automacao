function M = M(q,m,l,d, J, eta)
    q1 = q(1);
    q2 = q(2);
    
    m1 = m(1);
    m2 = m(2);
    
    l1 = l(1);
    l2 = l(2);
    
    b1 = d(1);
    r2 = d(2);
    
    Je = J(1);
    Ja = J(2);
    
    B11 = (m1*(l1^2 + b1^2))/12  +  m1*(l1/2)^2 + m2*l1^2 +(m2*l2^2*sin(q2)^2)/4 + (m2*3*r2^2 + l2^2*sin(q2)^2 + 3*r2^2*cos(q2)^2)/12;
    B11_motor = Je+(eta^2)*Ja;
    B12 = -((l1*l2*m2)*cos(q2))/2;
    B21 = B12;
    B22 = m2*(l2/2)^2 + (m2*(3*r2^2 + l2^2))/12;
    M = [B11+B11_motor B12;B21 B22];
end
