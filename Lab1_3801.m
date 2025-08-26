% Contributors: Isabelle Amodio
% Course number: ASEN 3801
% File name: AirRelativeVelocityVectorToWindAngles
% Created: 8/26/25

%% Parameters 
tspan=[0,20]';
tol=[1e-2,1e-4,1e-6,1e-8,1e-10]';
state0=[1; 0.5; -0.2; 0.3]';  % initial conditions (non-zero values)
%state=[w,x,y,z];

%% ODE45 
[t,state]=ode45(@(t,state) ODEsystem(t,state),tspan,state0);

%% Plot
w=state(:,1);
x=state(:,2);
y=state(:,3);
z=state(:,4);

figure;
% subplot for w
subplot(4,1,1)
plot(t,w,'LineWidth',1.5);
grid on
ylabel('w (n.d)')
title('Solution Over 0-20s')

% subplot for x
subplot(4,1,2)
plot(t,x,'LineWidth',1.5);
grid on
ylabel('x (n.d)')

% subplot for y
subplot(4,1,3)
plot(t,y,'LineWidth',1.5);
grid on
ylabel('y (n.d)')

% subplot for z
subplot(4,1,4)
plot(t,z,'LineWidth',1.5);
grid on
ylabel('z (n.d)')
xlabel('Time (s)')


%% function for dot values
function dot_value= ODEsystem(t,state)
w=state(1);
x=state(2);
y=state(3);
z=state(4);

w_dot=(-9*w)+y;
x_dot=(4*w*x*y)-(x^2);
y_dot=(2*w)-x-(2*z);
z_dot=(x*y)-(y^2)-(3*z*z*z);

dot_value=[w_dot,x_dot,y_dot,z_dot]';
end


