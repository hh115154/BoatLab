K = 0.16;
omega_0 = 0.7823;
sigma = sqrt(0.00079191);
lambda = 0.08;
T = 70.55;
Kw = 2*lambda*omega_0*sigma;

%syms K w G l T s

A = [0 1 0 0 0; -(omega_0)^2 -2*lambda*omega_0 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];  
B = [0; 0; 0; K/T; 0];
C = [0 1 1 0 0];
E = [0 0; Kw 0; 0 0; 0 0; 0 1];
D = 1; 
T1 = 10;

[ad, bd] = c2d(A, B, 1/T1);
[ad, ed] = c2d(A, E, 1/T1);
Cd = C; 
Dd = D; 

measurement_noise = var(compass.signals.values);

plot(compass.time, compass.signals.values, 'b');
hold on;
%display(bd);
%display(ed);