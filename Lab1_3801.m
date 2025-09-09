
% Contributors: Isabelle Amodio, Casey Gustafson, Hasan Kobeissy
% Course number: ASEN 3801
% File name: Lab1_3801.m
% Created: 8/26/25

close all;
clear all;
clc;


%% Parameters 
tspan=[0,20]';
state0=[1; 0.5; -0.2; 0.3]';  % initial conditions (non-zero values)
tol=[1e-2,1e-4,1e-6,1e-8,1e-10,1e-12]'; % tolerance values 

final_values=zeros(length(tol),4);

%% Error Values
for i=1:length(tol)
    [final_values(i,:),t,state] = ODEsolver(tol(i),i,tspan,state0);
end

reference_values=final_values(end,:);
errors=abs(final_values(1:end-1, :)-reference_values);

%% Create Table
errors_table=errors';
column_names={'1e-2','1e-4','1e-6','1e-8','1e-10'};
row_names={'|w-w_r|','|x-x_r|','|y-y_r|','|z-z_r|'};
table=array2table(errors_table,'VariableNames',column_names,'RowNames',row_names);
disp(table)


for i=1:length(tol)
    ODEsolver(tol(i),i,tspan,state0);
end

function [final_values,t,state] = ODEsolver(tol,fig_num,tspan,state0)
    % Set tolerances
    opts = odeset('RelTol',tol,'AbsTol',tol);
    
    % Solve ODE
    [t,state] = ode45(@ODEsystem, tspan, state0, opts);

    final_values=state(end,:);


%% ODE45 
[t,state]=ode45(@(t,state) ODEsystem(t,state),tspan,state0);

%% Plot
w=state(:,1);
x=state(:,2);
y=state(:,3);
z=state(:,4);

figure(fig_num)
sgtitle(sprintf('Solution with Tolerance = %.1e', tol))

% subplot for w
subplot(4,1,1)
plot(t,w,'LineWidth',1.5);
grid on
ylabel('w (n.d)')


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
xlabel('Time (n.d)')

set(gcf,'Name',sprintf('Tolerance %.1e', tol),'NumberTitle','off')

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
end

