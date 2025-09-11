function attitude321 = EulerAngles321(DCM)
    a = atan2(DCM(2,3)/DCM(3,3));
    b = -1*asin(DCM(1,3));
    y = atan2(DCM(1,2)/(-1*DCM(1,1)));

    attitude321 = [a;b;y];
end
