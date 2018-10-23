function [] = easyplot( inTime, inSignals, leg1,leg2, xAxis, yAxis, titl )
%PLOT Summary of this function goes here
%   Detailed explanation goes here
plot(inTime, inSignals);
legend(leg1,leg2)
xlabel(xAxis)
ylabel(yAxis)
title(titl)
grid on;


end

