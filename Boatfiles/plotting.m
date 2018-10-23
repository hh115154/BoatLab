plot(compass.time, compass.signals.values);
axis([0 1000 -550 50])
grid on
ylabel('Compass Angle [Deg]')
xlabel('Time [s]')
title('Compass angle response with sine input with frequency 0.05rad/s and noise')