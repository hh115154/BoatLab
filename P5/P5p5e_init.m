%Acquiring the correct matrices and constants
K_pd = 0.816058507166699;
psi_ref = 30;
T = 70.55;
K = 0.16;
T_f = 8.395449999999999;
Cd = [0 1 1 0 0];
ad = [0.996954313155578 0.0992754311108234 0 0 0;-0.0607558977016812 0.984528205994299 0 0 0;0 0 1 0.0999291617512947 -1.13341197928432e-05;0 0 0 0.998583569642080 -0.000226628857267288;0 0 0 0 1];
bd = [0;0;1.133411979284324e-05;2.266288572672879e-04;0];
Q_k = [30 0; 0 10^(-6)]*1;
I = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1];
R = 0.0020*pi^2/180^2;
ed = [1.752951148958393e-05 0;3.496817831985058e-04 0;0 -3.778486149100418e-07;0 -1.133411979284323e-05;0 0.100000000000000];
prior_x_est = [0; 0; 0; 0; 0]; 
prior_P_covar = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0; 0 0 0 1 0; 0 0 0 0 2.5*10^(-3)];
data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);


 figure;
 plot(est_psi_omega.time, est_psi_omega.signals.values, 'r');
 hold on; 
 plot(act_psi_omega.time, act_psi_omega.signals.values, 'b');
 hold on;  
<<<<<<< HEAD
 xlim([0 100]);
 ylim([-4 9]);
 
 %title('Wave Influence')
 legend('Estimated wave influence', 'Actual wave influence');
 xlabel('Time [s]');
ylabel('Wave Influence [deg]');
=======
 xlim([0 150]);
 ylim([-5, 8.2]);
 %title('Wave Influence')
 legend('Estimated wave influence', 'Actual wave influence');
 xlabel('Time [s]');
 ylabel('Wave Influence [deg]');
>>>>>>> f4d5423ecdedc4ad2b21462c9300a3d32f7b57a2



% %%Plotting the model
% plot(compass_ref.time,compass_ref.signals.values, '--black')
% hold on;
% plot(compass.time, compass.signals.values, 'b');
% hold on;
% plot(compass_est.time, compass_est.signals.values, 'r');
% hold on;
% plot(rudder.time, rudder.signals.values, 'k');
% hold on;
% plot(bias.time, bias.signals.values, 'g'); 
% 
% legend('Compass Angle reference', 'Ship Compass Angle', 'Estimated Compass Angle', 'Rudder input', 'Estimated Bias');
% xlabel('Time[s]');
% ylabel('Degrees[deg]');
% xlim([0 500]);
% ylim auto;
% hold off;