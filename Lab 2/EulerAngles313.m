function attitude313 = EulerAngles313(DCM)
a = atan2(DCM(1,3)/DCM(2,3));
b = acos(DCM(3,3));
y = atan(DCM(3,1)/-DCM(3,2));

attitude313 = [a;b;y];

end