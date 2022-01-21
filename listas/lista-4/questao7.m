
a = [1;1];

xd=[0.366; 1.366];

q0=[0;30]*pi/180;
x0 = [a(1)*cos(q0(1))+a(2)*cos(q0(1)+q0(2));a(1)*sin(q0(1))+a(2)*sin(q0(1)+q0(2))];

qk=q0;
xk=x0;

Q=[qk];
X=[xk];

for i=1:100
    jk = [-a(1)*sin(qk(1))-a(2)*sin(qk(1)+qk(2)) -a(2)*sin(qk(1)+qk(2));a(1)*cos(qk(1))+a(2)*cos(qk(1)+qk(2)) a(2)*cos(qk(1)+qk(2))];
    xk = [a(1)*cos(qk(1))+a(2)*cos(qk(1)+qk(2));a(1)*sin(qk(1))+a(2)*sin(qk(1)+qk(2))];

    qk1=qk+0.1*inv(jk)*(xd-xk);

    qk=qk1;
 
    Q=[Q qk];
    X=[X xk];
    %pause

end
