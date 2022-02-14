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
T = 3;   
out1 = sim('planar_kinctrl1',T);
out2 = sim('planar_kinctrl2',T);

%% Plot traj 1
%%% Control
figure;
subplot(2,1,1)
plot(out1.u1);
legend({'$u_1$','$u_2$','$u_3$'},'Interpreter','latex');
xlabel('$t$','Interpreter','latex');
ylabel('$u(t)$','Interpreter','latex')
title("Sinal de controle para trajetória 1");

%%% Error
subplot(2,1,2)
plot(out1.e1);
legend({'$e_x$','$e_y$','$e_{\phi}$'},'Interpreter','latex');
xlabel('$t$','Interpreter','latex');
ylabel('$e(t)$','Interpreter','latex')
title("Erro para trajetória 1");
ylim([0 1]);
saveas(gcf,"imgs/ue_planar1.png");

%%% Position
figure;
plot(out1.x1.data,out1.y1.data);
xlabel('$x(t)$','Interpreter','latex');
ylabel('$y(t)$','Interpreter','latex');
title("Posição para trajetória 1");
xlim([-0.05 0.55]);
ylim([0.2 0.8]);
set(gcf, 'Position',  [100, 100, 450, 400])
saveas(gcf,"imgs/x_planar1.png");

%% Plot traj 2
%%% Control
figure;
subplot(2,1,1)
plot(out2.u2);
legend({'$u_1$','$u_2$','$u_3$'},'Interpreter','latex');
xlabel('$t$','Interpreter','latex');
ylabel('$u(t)$','Interpreter','latex')
title("Sinal de controle para trajetória 2");

%%% Error
subplot(2,1,2)
plot(out2.e2);
legend({'$e_x$','$e_y$'},'Interpreter','latex');
xlabel('$t$','Interpreter','latex');
ylabel('$e(t)$','Interpreter','latex')
title("Erro para trajetória 2");
ylim([0 1]);
saveas(gcf,"imgs/ue_planar2.png");

%%% Position
figure;
plot(out2.x2.data,out2.y2.data);
xlabel('$x(t)$','Interpreter','latex');
ylabel('$y(t)$','Interpreter','latex');
title("Posição para trajetória 2");
xlim([-0.05 0.55]);
ylim([0.2 0.8]);
set(gcf, 'Position',  [100, 100, 450, 400])
saveas(gcf,"imgs/x_planar2.png");

