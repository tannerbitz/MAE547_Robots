clc
clear all 
close all 
warning off
 
addpath(genpath('rvctools')); 
a1 = 0.3; 
a2 = 0.3; 
d4 = 0.3; 

alpha = zeros(1,4);  a = [a1, a2, 0, 0]; 
d = [0, 0, 0, d4];  theta = zeros(1,4); 
dh = [theta' d' a' alpha']; 

L{1} = Link('d', dh(1,2), 'a', dh(1,3), 'alpha', dh(1,4)); 
L{2} = Link('d', dh(2,2), 'a', dh(2,3), 'alpha', dh(2,4)); 
L{3} = Link('theta', dh(3,2), 'a', dh(3,3), 'alpha', dh(3,4)); 
L{4} = Link('d', dh(4,2), 'a', dh(4,3), 'alpha', dh(4,4));
L{3}.qlim = [0, 0.2];  %add if prismatic joint


R = SerialLink([L{1} L{2} L{3} L{4}]);

qd = [0, pi/2, .16, pi/3];  

Td = R.fkine([qd]) 
W=[-2 2 -2 2 -2 2];
plot(R,qd,'workspace', W)
teach(R)
m=[1 1 1 0 0 1]';
q0=[pi/4, pi/2, 0.2, 0];  
qcomp = R.ikine(Td, q0, m, 'pinv') 
Tcomp = R.fkine(qcomp)

