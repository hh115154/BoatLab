function [psi,b] = Kalman_filter(compass_measurement,rudder_input)
%%%%%%%%%%%%%%ALGORITHM FOR COMPUTING KALMAN FILTER%%%%%%%%%%%%%%%%%%%%%%%
<<<<<<< HEAD
%Acquiring the correct matrices and constants
Cd = [0 1 1 0 0];
ad = [0.996954313155578 0.0992754311108234 0 0 0;-0.0607558977016812 0.984528205994299 0 0 0;0 0 1 0.0999291617512947 -1.13341197928432e-05;0 0 0 0.998583569642080 -0.000226628857267288;0 0 0 0 1];
Q_k = [30 0; 0 10^(-6)];
I = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1];
R = 0.0020*pi^2/180^2;

%%Defining init flag
persistent init_flag prior_x_est prior_P_covar;
%%Defining the needed starting conditions
if isempty(init_flag)
    prior_x_est = [0; 0; 0; 0; 0];
    prior_P_covar = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0; 0 0 0 1 0; 0 0 0 0 2.5*10^(-3)];
    init_flag = 1;
end


%%Computing Kalman gain
L_k = prior_P_covar * transpose(Cd) * (Cd * prior_P_covar * transpose(Cd) + R)^(-1);

%%Updating estimate with measurement y_k
x_est = rudder_input + L_k * (compass_measurement - Cd * rudder_input);

%%Computing error covariance for updated estimate
P_k = (I - L_k * Cd) * prior_P_covar * transpose(I - L_k * Cd) + L_k * R * transpose(L_k);

%%Project ahead
prior_x_est = ad * x_est;
prior_P_covar = ad * P_k * transpose(ad) + Q_k;

psi = x_est * Cd;
b = x_est*[0 0 0 0 1];
%outputArg1 = compass_measurement;
%outputArg2 = rudder_input;
end



