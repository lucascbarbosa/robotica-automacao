function [J05_real,J05]=jacob_punho(q)
    kinova = kinova_punho_dh();
    J05_real = kinova.jacob0(q);
    
    R01 = rotz(rad2deg(q(1)))*rotx(-90);
    R02 = R01*rotx(90)*rotz(rad2deg(q(2)));
    R03 = R02*rotx(-90)*rotz(rad2deg(q(3)));
    R04 = R03*rotx(90)*rotz(rad2deg(q(4)));
    
    h1 = [0;0;1];
    h2 = [0;0;1];
    h3 = [0;0;1];
    h4 = [0;0;1];
    
    h10 = R01*h1;
    h20 = R02*h2;
    h30 = R03*h3;
    h40 = R04*h4;
    
    h10_hat = skew(h10);
    h20_hat = skew(h20);
    h30_hat = skew(h30);
    h40_hat = skew(h40);
    
    p45 = [0;0;0.3413];
    p34 = [0;0;0];
    p23 = [0;0;0.4208];
    p12 = [0;0;0];
    
    p450 = R04*p45
    p350 = R03*p34+p450
    p250 = R02*p23+p350
    p150 = R01*p12+p250
 
    J05 = [
        h10_hat*p150 h20_hat*p250 h30_hat*p350 h40_hat*p450;
        h10 h20 h30 h40
        ];
end