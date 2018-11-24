% plot(compass.time, compass.signals.values);
% axis([0 5000 -4 70])
% grid on
% ylabel('Compass Angle [Deg]')
% xlabel('Time [s]')
% title('Compass angle response with sine (freq. 0.005rad/s) and wave/measurement noise')
fs = 10;%*2*pi;
x = (psi_w)%*pi)/180;

[pxx,f] = pwelch(x(2,:),4096,[],[],fs); %pwelch(x,window, [], [],fs);
%plot(f, pxx);

pxx1 = pxx/(2*pi);
f1 = f * 2*pi;
plot(f1,pxx1);
axis([0 2 -0.1 3])
grid minor;
xlabel('Frequency [rad/s]');
ylabel('Power Spectral Density [power s/rad]')

