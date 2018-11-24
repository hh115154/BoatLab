%Defining frequency
fs = 10;
x = (psi_w);
%PSD estimation from the second row of x (not time series) 
[pxx,f] = pwelch(x(2,:)*pi/180,4096,[],[],fs);

%Plotting with radians
pxx1 = pxx/(2*pi);
f1 = f * 2*pi;
plot(f1,pxx1);
axis([0 1.65 -0.00009 0.0010])
title('PSD estimation')
grid minor;
xlabel('Frequency [rad/s]');
ylabel('Power Spectral Density [power s/rad]')


%%Finding max value and corresponding frequency value%%
display(max(pxx1));
LineH = get(gca, 'children');
Value = get(LineH, 'YData');
Time = get(LineH, 'XData');
[maxValue, maxIndex] = max(Value);
maxTime = Time(maxIndex);
display(maxTime);



%%Problem 2d
%Defining frequency
fs = 10;
x = (psi_w);
%PSD estimation from the second row of x (not time series) 
[pxx,f] = pwelch(x(2,:)*pi/180,4096,[],[],fs);

%Plotting with radians
pxx1 = pxx/(2*pi);
f1 = f * 2*pi;
plot(f1,pxx1);
axis([0 1.65 -0.00009 0.0010])
title('PSD estimation vs mathematical model')
grid minor;
xlabel('Frequency [rad/s]');
ylabel('Power Spectral Density [power s/rad]')
hold on;


%%Finding max value and corresponding frequency value%%

%%Day 3
lambda1 = 0.03;
lambda2 = 0.08;
lambda3 = 0.25;
omega0 = 0.7823;
sigma = sqrt(0.00079191);

omega = f1; 
Kw = 2*lambda1*omega0*sigma;
pxx_1 = (omega.*Kw).^2./(omega.^4 + omega0^4 + 2*omega0^2*omega.^2*(2*lambda1^2-1));
plot(omega, pxx_1, 'g--')
hold on;
Kw = 2*lambda2*omega0*sigma;
pxx_1 = (omega.*Kw).^2./(omega.^4 + omega0^4 + 2*omega0^2*omega.^2*(2*lambda2^2-1));
plot(omega, pxx_1, 'r--')
hold on;
Kw = 2*lambda3*omega0*sigma;
pxx_1 = (omega.*Kw).^2./(omega.^4 + omega0^4 + 2*omega0^2*omega.^2*(2*lambda3^2-1));
plot(omega, pxx_1, '--')
hold on;
legend('PDS estimation','\lambda = 0.03', '\lambda = 0.08', '\lambda = 0.25');
axis([0 1.65 -0.00009 0.0010])




