function x = hw4_fwd_kin_pl(a1, a2, d4, q)
% forward kinematics for SCARA robot
t1 = q(1);
t2 = q(2);
d3 = q(3);
t4 = q(4);

x = [  a2*cos(t1 + t2) + a1*cos(t1);
       a2*sin(t1 + t2) + a1*sin(t1);
       - d3 - d4;
       t1 + t2 + t4 ];


end
