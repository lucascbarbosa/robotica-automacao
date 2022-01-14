function plotworkspace(DH,q)
% drawworkspace
%{
This function plots a workspace for a planar n-DOF revolute or prismatic
given DH parameters and the constraints of all variables.

This function uses Robotics Toolbox by Peter Corke which can be
downloaded from :
https://petercorke.com/wordpress/toolboxes/robotics-toolbox
----------------------------------------------
Inputs
DH    DH parameters each row is a link
q     a cell input contains constraints for all variables
        ordered from first link to last link.
---------------------------------------------------------------------
Example
a1 = 0.5; 
a2 = 0.3; 
a3 = 0.2;
DH(1) = Link([0 0 a1 0]);
DH(2) = Link([0 0 a2 0]);
DH(3) = Link([0 0 a3 0]);
th1 = (-pi/6:0.05:pi/6) ;
th2 = (-2*pi/3:0.05:2*pi/3);
th3 = (-pi/2:0.05:pi/2) ;
q = {th1,th2,th3};

All copyrights go to Mohammad Al-Fetyani
University of Jordan
%}

% L = Link([Th d a alpha])
r = SerialLink(DH);
r.display()
[~,n] = size(DH);


var = sym('q',[n 1]);
assume(var,'real')

% generate a grid of theta1 and theta2,3,4 values
[Q{1:numel(q)}] = ndgrid(q{:}); 
T = simplify(vpa(r.fkine(var),3));
Pos = T.tv;
x(var(:)) = Pos(1);
X = matlabFunction(x);
X = X(Q{:});
y(var(:)) = Pos(2);
Y = matlabFunction(y);
Y = Y(Q{:});
plot(X(:),Y(:),'r.')
xlabel('X')
ylabel('Y')
end