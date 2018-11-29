
%% Problem 1
syms t1 a1 t2 a2 d3 d4 t4

% Calculate DH Homogeneous Transformation Matrices for each link
A01 = simplify(DHTransform(t1, 0, 0, a1));
A12 = simplify(DHTransform(t2, 0, pi, a2));
A23 = simplify(DHTransform(0, d3, 0, 0));
A34 = simplify(DHTransform(t4, d4, 0, 0));

% Calculate Homogeneous Transformation Matrices from base frame to end of
% each link
T01 = simplify(A01);
T02 = simplify(T01*A12);
T03 = simplify(T02*A23);
Te = simplify(T03*A34);

% Extract necessary vectors from Homogeneous transforms to calculcate the
% Jacobian
z0 = T01(1:3, 3);
z1 = T02(1:3, 3);
z2 = T03(1:3, 3);
z3 = Te(1:3, 3);
P0 = [0, 0, 0]';
P1 = T01(1:3, 4);
P2 = T02(1:3, 4);
P3 = T03(1:3, 4);
Pe = Te(1:3, 4);

% Calculate the Jacobian
J = [ cross(z0, Pe-P0), cross(z1, Pe-P1),          z2, cross(z3, Pe-P3);
                    z0,               z1, zeros(3, 1),              z3];

