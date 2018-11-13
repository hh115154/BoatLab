%%%%%%%%%%%%%%ALGORITHM FOR COMPUTING KALMAN FILTER%%%%%%%%%%%%%%%%%%%%%%%
%Acquiring the correct matrices
run P5p5a_init.m;
run P3/P5p3d_init;

%%Defining the needed starting conditions
prior_x_est = [0; 0; 0; 0; 0];
prior_P_covar = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0; 0 0 0 1 0; 0 0 0 0 2.5*10^(-3)];

%%Computing Kalman gain
L_k = prior_P_covar * transpose(Cd) * (Cd * prior_P_covar * transpose(Cd) + measurement_noise)^(-1);

%%Updating estimate with measurement y_k

