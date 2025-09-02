clear all 
clc

% Contributors: Isabelle Amodio, Casey Gustafson, Hasan Kobeissy
% Course number: ASEN 3801
% File name: AirRelativeVelocityVectorToWindAngles
% Created: 9/2/2025

tspan=[0,20];
x_0=[0,0,0,0,20,-20]; %initial conditions
% Constants
C_d=0.6; % coefficient of drag

V=(0.01)*(0.01)*(0.01)*(4/3)*pi;
A=(0.01)*(0.01)*pi;
g=9.81;
m=0.05;

% Density from atm function
[~,~,~,rho]=stdatmo(1655); % kg/m^3

f_gravity=[0,0,m*g]; %force of gravity acting in positive z-direction
f_drag_magnitude=C_d*A*(rho*(V*V))/2;


%% Function for state vector

x=[p_n,p_e,p_d,v_n,v_e,v_d]; % statevector set up
a=[a_n,a_e,a_d]; % acceleration vector


