%% Define model
clear all;
close all;
%         theta d  a  alpha type mdh  offset
L(1) = Link([ 0 0 0.5	0	0], 'standard');
L(2) = Link([ 0 0 0.5	0	0], 'standard');
L(3) = Link([ 0 0 0.5	0	0], 'standard');

planar = SerialLink(L,'name','');

%% Define initial configuration
q0 = [pi -pi/2 -pi/2]; 

%% Run simulations
T = 10;   
out = sim('planar_kinctrl1',T);
% sim('planar_kinctrl2',T);

%% Plot traj 1
%%% Control
figure;
subplot(2,1,1)
plot(out.u1);
legend({'$u_1$','$u_2$','$u_3$'},'Interpreter','latex');
xlabel('$t$','Interpreter','latex');
ylabel('$u(t)$','Interpreter','latex')
title("Sinal de controle para trajetória 1");

%%% Error
subplot(2,1,2)
plot(out.e1);
legend({'$e_x$','$e_y$'},'Interpreter','latex');
xlabel('$t$','Interpreter','latex');
ylabel('$e(t)$','Interpreter','latex')
title("Erro para trajetória 1");
saveas(gcf,"imgs/ue_planar1.png");

%%% Position
figure;
plot(out.x1.data,out.y1.data);
xlabel('$x(t)$','Interpreter','latex');
ylabel('$y(t)$','Interpreter','latex');
title("Posição para trajetória 1");
saveas(gcf,"imgs/x_planar1.png");


