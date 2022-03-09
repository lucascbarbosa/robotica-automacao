close all;
clear all;
%% Manipulator

% mass
ml1 = 50; %kg
ml2 = 50; %kg

mm1 = 50; %kg
mm2 = 50; %kg

% dimensions
l1 = 0.5; %m
l2 = 0.5; %m

a1 = 1; %m
a2 = 1; %m

% Inertia moment
Il1 = 10; %kgm^2
Il2 = 10; %kgm^2

Im1 = 0.01; %kgm^2
Im2 = 0.01; %kgm^2

% Reduction
Kr1 = 100;
Kr2 = 100;

% initial values
q0 = [0 0 0 0]';
% M_ matriz
b11 = Il1 + ml1*l1^2+(Kr1^2)*Im1 + Il2 + ml2*(a1^2+l2^2) + Im2 + mm2*a1^2;
b12 = Il2 + ml2*l2^2 + Kr2*Im2;
b21 = b12;
b22 = Il2 + ml2^2 + Kr2^2*Im2;

M_ = [
    b11 0;
    0   b22]



%% Requirements
zeta = 1;
wn = 5;

%% Control parameters
[Kp,Ki,Kd,Ka]=ppi_tuning(zeta,wn,M_);
Kp = double(Kp);


%% Plots

traj = ["rapida" "lenta"];

for traj_switch = 0:1
    out = sim('ppi_ctrl.slx',5);

    % Position
    figure
    subplot(2,1,1)
    plot(out.q)
    hold on
    plot(out.qd)
    title("Comparacao de posicao para trajetoria "+traj(traj_switch+1),"Interpreter","latex")
    xlabel("$t$","Interpreter","latex")
    ylabel("$\theta(t)$","Interpreter","latex")
    legend({'$\theta$','$\theta_d$'},"Interpreter","latex")

    % Velocity
    subplot(2,1,2)
    plot(out.qdot)
    hold on
    plot(out.qddot)
    title("Comparacao de velocidade para trajetoria "+traj(traj_switch+1),"Interpreter","latex")
    xlabel("$t$","Interpreter","latex")
    ylabel("$\theta(t)$","Interpreter","latex")
    legend({'$\dot\theta$','$\dot\theta_d$'},"Interpreter","latex")
    saveas(gcf,"imgs/ppi_q_qd_"+traj(traj_switch+1)+".png");

    % Torque
    figure
    plot(out.u)
    title("Torque para trajetoria "+traj(traj_switch+1),"Interpreter","latex")
    xlabel("$t$","Interpreter","latex")
    ylabel("$u(t)$","Interpreter","latex")
    legend({'$u_1(t)$','$u_2(t)$'},"Interpreter","latex")
    saveas(gcf,"imgs/ppi_u_"+traj(traj_switch+1)+".png");
end

%% Plots mod ml2

ml2 = 60; %kg

% M_ matriz
b11 = Il1 + ml1*l1^2+(Kr1^2)*Im1 + Il2 + ml2*(a1^2+l2^2) + Im2 + mm2*a1^2;
b12 = Il2 + ml2*l2^2 + Kr2*Im2;
b21 = b12;
b22 = Il2 + ml2^2 + Kr2^2*Im2;

M_ = [
    b11 0;
    0   b22]

for traj_switch = 0:1
    out = sim('ppi_ctrl.slx',5);

    % Position
    figure
    subplot(2,1,1)
    plot(out.q)
    hold on
    plot(out.qd)
    title({"Comparacao de posicao para trajetoria "+traj(traj_switch+1)+" com $ m_{l_2} $ modificada"},"Interpreter","latex")
    xlabel("$t$","Interpreter","latex")
    ylabel("$\theta(t)$","Interpreter","latex")
    legend({'$\theta$','$\theta_d$'},"Interpreter","latex")

    % Velocity
    subplot(2,1,2)
    plot(out.qdot)
    hold on
    plot(out.qddot)
    title({"Comparacao de velocidade para trajetoria "+traj(traj_switch+1)+" com $ m_{l_2} $ modificada"},"Interpreter","latex")
    xlabel("$t$","Interpreter","latex")
    ylabel("$\theta(t)$","Interpreter","latex")
    legend({'$\dot\theta$','$\dot\theta_d$'},"Interpreter","latex")
    saveas(gcf,"imgs/ppi_q_qd_"+traj(traj_switch+1)+"_mod.png");

    % Torque
    figure
    plot(out.u)
    title({"Torque para trajetoria "+traj(traj_switch+1)+" com $ m_{l_2} $ modificada"},"Interpreter","latex")
    xlabel("$t$","Interpreter","latex")
    ylabel("$u(t)$","Interpreter","latex")
    legend({'$u_1(t)$','$u_2(t)$'},"Interpreter","latex")
    saveas(gcf,"imgs/ppi_u_"+traj(traj_switch+1)+"_mod.png");
end