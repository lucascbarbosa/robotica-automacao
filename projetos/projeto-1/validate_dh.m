function [T_real,R_ideal] = validate_dh(kinova,q)
    T_real = kinova.fkine(q);
    R_ideal = rotz(rad2deg(q(1)))*rotx(-90)*rotz(rad2deg(q(2)))*rotx(90)*rotz(rad2deg(q(3)))*rotx(-90)*rotz(rad2deg(q(4)))*rotx(90)*rotz(rad2deg(q(5)))*rotx(-90)*rotz(rad2deg(q(6)))*rotx(90)*rotz(rad2deg(q(7)));
end