%Determining constants
%Calculating amplitude with w1.
a_max_1 = max(compass.signals.values); %Finding max values of signal with w1.
a_min_1 = min(compass.signals.values(1000:5000)); %Min values
A_1 = (a_max_1 - a_min_1)/2; %Amplitude w1
%Calculating amplitude with w2
a_max_2 = max(compass2.signals.values); %Finding max values of signal with w2
a_min_2 = min(compass2.signals.values(1000:5000)); %Min values
A_2 = (a_max_2 - a_min_2)/2; %Amplitude w2

w_1 = 0.005;
w_2 = 0.05;

%Time constant and gain
T = sqrt((A_2^2*w_2^2 - A_1^2*w_1^2)/(A_1^2*w_1^4 - A_2^2*w_2^4)); 
K = A_1*w_1*sqrt(1+T^2*w_1^2);

%%Running simulink
sim('P5p1c.mdl', 5000);

%Plot
plot(compass.time, compass.signals.values);
axis([0 5000 -4 70])
grid on
ylabel('Compass Angle [Deg]')
xlabel('Time [s]')
title('Compass angle response with sine (freq. 0.005rad/s) and wave/measurement noise');
