clear all;
close all;
a = [0;0;0;0;0;0;0];
alpha = [-pi/2;pi/2;-pi/2;pi/2;-pi/2;pi/2;0];
d = [0.2848;0;0.4208;0;0.3143;0;0.1674];
theta = [0;0;0;0;0;0;pi/2];
offset = [0;0;0;0;0;0;0];
%            theta    d           a      alpha  type mdh  offset
for i=1:7
    L(i) = Link([theta(i) d(i) a(i) alpha(i) 0 offset(i)],'standard');
end
kinova = SerialLink(L,'name',' ');
 
% for i=0:3
%     q = rand( 1, 7 ,'double')*2*pi
%     T = kinova.fkine(q)
%     figure;
%     kinova.plot(q);
%     saveas(gcf,"imgs/kinova_q"+int2str(i)+".png");
%     close;
% end