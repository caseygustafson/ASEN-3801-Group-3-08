% Contributors: Isabelle Amodio
% Course number: ASEN 3801
% File name: RotationMatrix313.m
% Created: 9/9/2025

function DCM=RotationMatrix313(attitude313)
phi=attitude313(1);
theta=attitude313(2);
psi=attitude313(3);

R_phi=[cos(phi) sin(phi) 0; -sin(phi) cos(phi) 0; 0 0 1];
R_theta=[1 0 0; 0 cos(theta) sin(theta);0 -sin(theta) cos(theta)];
R_psi=[cos(psi) sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1];

DCM=R_phi*R_theta*R_psi;

end