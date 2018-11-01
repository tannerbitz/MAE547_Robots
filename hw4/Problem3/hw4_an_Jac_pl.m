function J = hw4_an_Jac_pl(a1, a2, q)
t1 = q(1);
t2 = q(2);

J = [ - a2*sin(t1 + t2) - a1*sin(t1),  a2*sin(t1 + t2),  0,  0;
        a2*cos(t1 + t2) + a1*cos(t1), -a2*cos(t1 + t2),  0,  0;
                                   0,                0, -1,  0;
                                   1,               -1,  0, -1];

end