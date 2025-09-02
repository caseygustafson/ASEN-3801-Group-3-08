clear
clc
close all;

% initializing constants
rho = 1.04;
m = 0.05;
g = 9.81;
Cd = 0.6;
A = (0.01^2)*pi;
wind_vel = [0,0,0]';


% ode45 function
X0 = [0,0,0,0,20,-20]';
tspan = [0,40];
[t,X]=ode45(@(t,X) objectEOM(t,X,rho,Cd,A,m,g,wind_vel),tspan,X0);


%% plotting
figure()
plot3(X(:,1),X(:,2),X(:,3))
xlabel('x')
ylabel('y')
zlabel('z')


%% function for ode45
function xdot = objectEOM(t,X,rho,Cd,A,m,g,wind_vel)

    % state vector components
    x_E = X(1);
    y_E = X(2);
    z_E = X(3);
    u_E = X(4);
    v_E = X(5);
    w_E = X(6);

    


    % Calculate air relative velocity
     Vx = u_E - wind_vel(1);
     Vy = v_E - wind_vel(2);
     Vz = w_E - wind_vel(3);

     V = [Vx, Vy, Vz];
     Speed = norm(V);

     V_unit = V/Speed;

    
    % calculating drag and weight
    F_drag_Mag = Cd*A*rho*(Speed^2)/2;
    F_drag = F_drag_Mag*V_unit;
 
    Fg = m * [0, 0, -g];

    a_E = (Fg - F_drag)/m;

    xdot = [u_E,v_E,w_E, a_E(1), a_E(2), a_E(3)]';
end