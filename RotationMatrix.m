

% Contributors: Isabelle Amodio
% Course number: ASEN 3801
% File name: DCM_321.m
% Created: 8/26/25


function DCM= RotationMatrix(attitude321)

phi=attitude321(1);
theta=attitude321(2);
psi=attitude321(3);

R_phi=[1 0 0;0 cos(phi) sin(phi);0 -sin(phi) cos(phi)];
R_theta=[cos(theta) 0 -sin(theta);0 1 0;sin(theta) 0 cos(theta)];
R_psi=[cos(psi) sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];

DCM=R_phi*R_theta*R_psi;


end