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
    0   b22];

%% Requirements
zeta = 1;
wn = 5;

%% Control parameters
Kp = wn^2;
Kd = 2*zeta*wn;

%% Select desired trajectory
traj_switch = 0;

%% Simulate

%% Plots
