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

%% Define initial configuration
q0 = [0 0 0 pi/2 0 0 0];

%% Get optimal gains
run('K_opt.m')
switch_xd = 0;

%% Run simulations
for switch_xd = 0:2
    K1 = Ks(1,switch_xd+1);
    K2 = Ks(2,switch_xd+1);
    
    T = 20;
    
    sim('kinova_kinctrl1',T);
    sim('kinova_kinctrl2',T);

    %% Plot PIJ
    %%% Control
    figure;
    subplot(2,1,1)
    plot(u1);
    legend({'$u_1$','$u_2$','$u_3$','$u_4$'},'Interpreter','latex');
    xlabel('$t$','Interpreter','latex');
    ylabel('$u(t)$','Interpreter','latex')
    title("Sinal de controle para o controlador PIJ e trajetória " + int2str(switch_xd+1));
    
    %%% Error
    subplot(2,1,2)
    plot(e1);
    legend({'$e_x$','$e_y$','$e_z$'},'Interpreter','latex');
    xlabel('$t$','Interpreter','latex');
    ylabel('$e(t)$','Interpreter','latex')
    title("Erro para o controlador PIJ e trajetória " + int2str(switch_xd+1));
    saveas(gcf,"imgs/ue_PIJ_xd"+int2str(switch_xd+1)+".png");
    
    %%% Position
    figure;
    plot(x1.data,z1.data);
    xlabel('$x(t)$','Interpreter','latex');
    ylabel('$z(t)$','Interpreter','latex')
    title("Posição para o controlador PIJ e trajetória " + int2str(switch_xd+1));
    saveas(gcf,"imgs/x_PIJ_xd"+int2str(switch_xd+1)+".png");

    %% Plot TJ
    figure;
    %%% Control
    subplot(2,1,1)
    plot(u2);
    legend({'$u_1$','$u_2$','$u_3$','$u_4$'},'Interpreter','latex');
    xlabel('$t$','Interpreter','latex');
    ylabel('$u(t)$','Interpreter','latex')
    title("Sinal de controle para o controlador TJ e trajetória " + int2str(switch_xd+1));
    
    %%% Error
    subplot(2,1,2)
    plot(e2);
    legend({'$e_x$','$e_y$','$e_z$'},'Interpreter','latex');
    xlabel('$t$','Interpreter','latex');
    ylabel('$e(t)$','Interpreter','latex')
    title("Erro para o controlador TJ e trajetória " + int2str(switch_xd+1));
    saveas(gcf,"imgs/ue_TJ_xd"+int2str(switch_xd+1)+".png");

    %%% Position
    figure;
    plot(x2.data,z2.data);
    xlabel('$x(t)$','Interpreter','latex');
    ylabel('$z(t)$','Interpreter','latex')
    title("Posição para o controlador TJ e trajetória " + int2str(switch_xd+1));
    saveas(gcf,"imgs/x_TJ_xd"+int2str(switch_xd+1)+".png");


end
