%Constants
%%%%NOT NECESSARY FOR THIS TASK, VALUES ALREADY CALCULATED!%%%%
a_max_1 = max(compass.signals.values);
a_min_1 = min(compass.signals.values(1000:5000));
%a_max_2 = max(compass2.signals.values); 
%a_min_2 = min(compass2.signals.values(1000:5000));
A_1 = (a_max_1 - a_min_1)/2;
%A_2 = (a_max_2 - a_min_2)/2;
w_1 = 0.005;
w_2 = 0.05;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Time constant and gain
T = 70.55; %sqrt((A_2^2*w_2^2 - A_1^2*w_1^2)/(A_1^2*w_1^4 - A_2^2*w_2^4)); 
K = 0.16; %A_1*w_1*sqrt(1+T^2*w_1^2);

%plot of responses
plot(compass.time, compass.signals.values,'r');
hold on;
plot(model.time, model.signals.values,'b');
legend('Ship response','Model response');
xlabel('Time [s]');
ylabel('Compass angle [Deg]');
title('Ship response vs model response');
grid on;
hold off;