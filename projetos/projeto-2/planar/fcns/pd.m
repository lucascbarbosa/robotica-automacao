function pd  = fcn(t)

    pd = [0.25*(1-cos(pi*t)) 0.25*(2+sin(pi*t)) sin(pi*t/24 )]';
    pddot = [0.25*pi*sin(pi*t) 0.25*pi*cos(pi*t) (pi/24)*cos(pi*t/24)]';

    pd=[xd;xddot];

