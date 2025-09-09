function attitude321 = EulerAngles321(DCM)
    sie = atan2(DCM(2,3)/DCM(3,3));
    theta = -1*asin(DCM(1,3));
    phi = atan2(DCM(1,2)/(-1*DCM(1,1)));

    attitude321 = [sie, theta, phi];
end
