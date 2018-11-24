%%Use the correct values for K.
K = 0.16;
T = 70.55;

%%Drawing bode plot.
%%given
w_c = 0.1;
%%0.119 is alpha, defined to lift the phase.
T_f = 0.119*T; 
%%Reference for compass angle
psi_ref = 30;

K_pd_desibel = -log10(K) + log10(w_c) + log10(abs(complex(1, w_c*T_f)));
K_pd = 10^((K_pd_desibel));
s = tf('s');
H_0 = K * K_pd/(s*(1+T_f*s));
%sys = tf(H_0);
figure;
bode(H_0);
margin(H_0);

%%Running simulink
addpath CommonFiles
load wave.mat
sim('P5p3cx.slx', 5000);

%%Plotting the model
figure;
plot(compass_ref.time,compass_ref.signals.values, '--r')
hold on;
plot(compass1.time, compass1.signals.values, 'b');
hold on;
plot(rudder_comp.time, rudder_comp.signals.values, 'k');
legend('Compass reference', 'Ship Compass', 'Rudder input');
xlabel('Time[s]');
ylabel('Angle[deg]');
xlim([0 500]);
ylim auto;
hold off;

