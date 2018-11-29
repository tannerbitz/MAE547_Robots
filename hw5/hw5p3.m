% Link parameters
L(1) = Link('prismatic', 'd', 0, 'a', 1, 'alpha', 0);
L(2) = Link('prismatic', 'd', 0, 'a', 1, 'alpha', 0);
L(3) = Link('prismatic', 'd', 0, 'a', 1, 'alpha', 0);
L(1).I = 10*eye(3);
L(2).I = 10*eye(3);
L(3).I = 10*eye(3);
L(1).Jm = 0.01*eye(3);
L(2).Jm = 0.01*eye(3);
L(3).Jm = 0.01*eye(3);
L(1).m = 50;
L(2).m = 50;
L(3).m = 50;
L(1).r = [0.5, 0, 0]';
L(2).r = [0.5, 0, 0]';
L(3).r = [0.5, 0, 0]';
L(1).G = 100;
L(2).G = 100;
L(3).G = 100;

%Build robot
rbt = SerialLink(L, 'name', 'hw5p3');

% Specify torque, and initial conditions
Tfinal = 4;
Q0 = [-60*pi/180, 90*pi/180, 30*pi/180]';
QD0 = [0, 0, 0]';
[T, Q, QD] = rbt.fdyn(Tfinal, @mytorfun, Q0, QD0);

%% Plot results
figure(1)
subplot(3, 1, 1)
plot(T, Q(:,1))
xlabel('Time (s)')
ylabel('$\theta_1$ (rad)', 'Interpreter', 'latex')
title('Joint Angle 1')

subplot(3, 1, 2)
plot(T, Q(:,2))
xlabel('Time (s)')
ylabel('$\theta_2$ (rad)', 'Interpreter', 'latex')
title('Joint Angle 2')

subplot(3, 1, 3)
plot(T, Q(:,3))
xlabel('Time (s)')
ylabel('$\theta_3$ (rad)', 'Interpreter', 'latex')
title('Joint Angle 3')


figure(2)
subplot(3, 1, 1)
plot(T, QD(:,1))
xlabel('Time (s)')
ylabel('$\dot{\theta_1}$ (rad/s)', 'Interpreter', 'latex')
title('Joint Rate 1')

subplot(3, 1, 2)
plot(T, QD(:,2))
xlabel('Time (s)')
ylabel('$\dot{\theta_2}$ (rad/s)', 'Interpreter', 'latex')
title('Joint Rate 2')

subplot(3, 1, 3)
plot(T, QD(:,3))
xlabel('Time (s)')
ylabel('$\dot{\theta_3}$ (rad/s)', 'Interpreter', 'latex')
title('Joint Rate 3')

