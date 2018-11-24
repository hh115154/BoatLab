%% Define needed constants and initial values for kalman filter and simulation.
run P5p5c

%%Running simulink
addpath CommonFiles
load wave.mat
sim('P5p5dx.slx', 5000);
%% PLOTTING PROBLEM 5d
figure;
hold on;
plot(compass_ref.time, compass_ref.signals.values, '--');
plot(compass.time, compass.signals.values, 'r');
%plot(compass_est.time, compass_est.signals.values, 'r');
plot(rudder.time, rudder.signals.values, 'k');
plot(bias_est.time, bias_est.signals.values, 'g');
%%plot(rudder_comp.time, rudder_comp.signals.values,'-.c');
legend('Reference for compass angle', 'Measured compass angle', 'Rudder input', 'Estimated bias', 'Rudder input from P5p3c');
title('Kalman feed forward')
xlabel('Time[s]');
ylabel('Angle[deg]');
xlim([0 500]);
ylim auto;  
hold off;

