syms s K lambda omega;
F = (K*s)/(s^2+2*lambda*omega*s+omega^2);
A = ilaplace(F); 

%B = laplace(A);

ev(A)