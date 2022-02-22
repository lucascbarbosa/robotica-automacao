close all;
clear all;
load('projeto3.mat');
%% Manipulator
% gravity
g = 9.81;

% mass
m1 = 0.25; %kg
m2 = 0.15; %kg
m = [m1 m2];

% dimensions
l1 = 0.187; %m
l2 = 0.34; %m
l = [l1 l2];
b1 = 38e-3; %m
r2 = 6.5e-3; %m
d = [b1 r2];

% initial values
q01 = [0; 0];       % data01
q02 = [0; pi/2-0.01];   % data02
q03 = [0; pi/2-0.01];   % data03

qdot0 = [0;0];

%% DC Motor
Vin = 0;
La = 0.18;
Ra = 2.6;
Kt = 0.00767;
eta = 70;
Ke = 0.00767;

%% Simulate

%% Plots
q0 = q01;
motor_switch = 0;
data_exp = data01;

out = sim('dynctrl.slx',20);
plot(data_exp(:,1),data_exp(:,2),'--')
hold on
plot(data_exp(:,1),data_exp(:,3),'--')
hold on
plot(out.q)
xlabel('$t$','Interpreter','latex')
legend({'$\theta_1$ experimental','$\theta_2$ experimental','$\theta_1$ simulado','$\theta_2$ simulado'},'Interpreter','latex')
title('$\theta(t)$ para $\theta_0 = ['+string(q0(1))+'\;'+string(q0(2))+']^T$ e motor desligado','Interpreter','latex')

q0 = q02;
data_exp = data02;

figure
out = sim('dynctrl.slx',20);
plot(data_exp(:,1),data_exp(:,2),'--')
hold on
plot(data_exp(:,1),data_exp(:,3),'--')
hold on
plot(out.q)
xlabel('$t$','Interpreter','latex')
legend({'$\theta_1$ experimental','$\theta_2$ experimental','$\theta_1$ simulado','$\theta_2$ simulado'},'Interpreter','latex')
title('$\theta(t)$ para $\theta_0 = ['+string(q0(1))+'\;'+string(q0(2))+']^T$ e motor desligado','Interpreter','latex')

q0 = q03;
motor_switch = 1;
data_exp = data03;

figure
out = sim('dynctrl.slx',20);
plot(data_exp(:,1),data_exp(:,2),'--')
hold on
plot(data_exp(:,1),data_exp(:,3),'--')
hold on
plot(out.q)
xlabel('$t$','Interpreter','latex')
legend({'$\theta_1$ experimental','$\theta_2$ experimental','$\theta_1$ simulado','$\theta_2$ simulado'},'Interpreter','latex')
title('$\theta(t)$ para $\theta_0 = ['+string(q0(1))+'\;'+string(q0(2))+']^T$ e motor desligado','Interpreter','latex')

