plot(compass.time, compass.signals.values);
axis([0 5000 -4 70])
grid on
ylabel('Compass Angle [Deg]')
xlabel('Time [s]')
title('Compass angle response with sine (freq. 0.005rad/s) and wave/measurement noise')

fs = 10*
x = psi_w

[pxx,f] = pwelch(x,window, [], [],fs)