%% Define DH model

clear all;
close all;
a = [0;0;0;0;0;0;0];
alpha = [pi/2;pi/2;pi/2;pi/2;pi/2;pi/2;pi];
d = [0;0;-0.4208;0;-0.3143;0;0];
theta = [0;0;0;0;0;0;0];
offset = [0;pi;pi;pi;pi;pi;pi];
%            theta    d           a      alpha  type mdh  offset
for i=1:7
    L(i) = Link([theta(i) d(i) a(i) alpha(i) 0 offset(i)],'standard');
end
kinova = SerialLink(L,'name',' ');

%% Define initial and home configurations
q0 = [0 0 0 pi/2 0 0 0];
qhome = [0 15 180 230 0 55 90]*pi/180;

%% Get optimal gains
run('K_opt.m')
switch_xd = 0;

%% Run simulation
for switch_xd = 0:2
    K1 = Ks(1,switch_xd+1);
    K2 = Ks(2,switch_xd+1);

    sim('kinova_kinctrl1',20);
    sim('kinova_kinctrl2',20);

    %% Plots
    %%% Control
    figure;
    plot(u1);
    legend({'$u_1$','$u_2$','$u_3$'},'Interpreter','latex');
    xlabel('$t$','Interpreter','latex');
    ylabel('$u$','Interpreter','latex')
    title({"Sinal do Controlador PIJ e trajetória $x_{d"+int2str(switch_xd+1)+"}$"},'Interpreter','latex');
    %%% Position
    figure;
    plot(x1.data,z1.data);
    xlabel('$x(t)$','Interpreter','latex');
    ylabel('$z(t)$','Interpreter','latex')
    title({"Posição para o Controlador PIJ e trajetória $x_{d"+int2str(switch_xd+1)+"}$"},'Interpreter','latex');

end
