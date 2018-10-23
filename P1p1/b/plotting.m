plot(compass.time, compass.signals.values);
axis([0 5000 -4 70])
grid on
ylabel('Compass Angle [Deg]')
xlabel('Time [s]')
title('Compass angle response with sine (freq. 0.005rad/s) and wave/measurement noise')

fs = 10*2*pi;
x = psi_w/(2*pi)

[pxx,f] = pwelch(x,window, [], [],fs)
pxx1 = pxx/(2*pi)
f1 = f * 2*pi
