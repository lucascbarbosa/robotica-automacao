function tau = jacob_forcas(q)
    kinova = kinova_dh();
    qhome = deg2rad([0 15 180 230 0 55 90]);
    Jhome = kinova.jacob0(qhome);
    g = -25;
    f = [0;0;g;0;0;0];
    
    tau_ap = (Jhome')*f;
    tau = -tau_ap;
    
end