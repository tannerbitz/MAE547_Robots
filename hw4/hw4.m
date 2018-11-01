
%% Problem 1
syms c1 s1 a1 c2 s2 a2 d3 c4 s4 d4;

% DH Parameter Homogeneous Transforms
A01 = [c1, -s1, 0, a1*c1;
       s1,  c1, 0, a1*s1;
        0,   0, 1,     0;
        0,   0, 0,     1];
    

A12 = [c2,  s2,  0, a2*c2;
       s2, -c2,  0, a2*s2;
        0,   0, -1,     0;
        0,   0,  0,     1];
    
A23 = [1, 0, 0,  0;
       0, 1, 0,  0;
       0, 0, 1, d3;
       0, 0, 0,  1];

A34 = [c4, -s4, 0,  0;
       s4,  c4, 0,  0;
        0,   0, 1, d4;
        0,   0, 0,  1];
    
% Homogeneous Transforms
T02 = simplify(A01*A12);
T03 = simplify(T02*A23);
Te = simplify(T03*A34);

    
 