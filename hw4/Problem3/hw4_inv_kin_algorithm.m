clear all
clc

% Robot Geometry
a1 = 0.3;
a2 = 0.3;
d4 = 0.3;

% Time to simulate
t=0:0.001:2.5;

% Initial joint parameters
q = zeros(4,length(t));
q(:,1) = [pi/4, pi/2, 0.2, 0]';



pd = [0.42.*cos(t.*pi/10); 0.42.*sin(t.*pi/10); 0.1.*(1+sin(t))];
phid = t*pi/10 + 7*pi/12;
pd_dot = [-0.42*pi/10*sin(t*pi/10); 0.42*pi/10*cos(t*pi/10); 0.1*cos(t)];
phid_dot = pi/10;
K=0.1*eye(4,4);
xe = [];
for i = 1:length(t)
    xe(:,i)= hw4_fwd_kin_pl(a1, a2, d4, q(:,i));
    Ja = hw4_an_Jac_pl(a1, a2, q(:,i));

    e(:,i)=[pd(:,i); phid(i)] - xe(:,i);
    xd_dot=[pd_dot(:,i); phid_dot];
    qdot = inv(Ja)*(xd_dot+K*e(:,i));
    q(:,i+1)=q(:,i)+qdot*0.001;
end

max(e(:))

