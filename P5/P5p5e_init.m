%Acquiring the correct matrices and constants
run P5p5c_init.m

%%%%%%%%%%%%%%%%%%Plotting%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure;
 plot(est_psi_omega.time, est_psi_omega.signals.values, 'r');
 hold on; 
 plot(act_psi_omega.time, act_psi_omega.signals.values, 'b');
 hold on;  

 xlim([0 150]);
 ylim([-5, 8.2]);
 %title('Wave Influence')
 legend('Estimated wave influence', 'Actual wave influence');
 xlabel('Time [s]');
 ylabel('Wave Influence [deg]');



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