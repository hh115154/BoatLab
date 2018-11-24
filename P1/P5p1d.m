
%Time constant and gain
T = 70.55;
K = 0.16;

%%Running simulink
addpath CommonFiles
load wave.mat
sim('P5p1dx.mdl', 5000);

%plot of responses
figure;
plot(compass.time, compass.signals.values,'r');
hold on;
plot(model.time, model.signals.values,'b');
legend('Ship response','Model response');
xlabel('Time [s]');
ylabel('Compass angle [Deg]');
title('Ship response vs model response');
grid on;
hold off;