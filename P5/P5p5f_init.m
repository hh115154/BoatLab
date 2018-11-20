%% GET REQUIRED MATRICES
run P5p5c_init.m

%% VARYING Q_k
Q_k = [30 0; 0 10^(-6)] * 1;
%Push into workspace
assignin('base', 'Q_k', Q_k);
%Vary the struct
data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
%Push into workspace
assignin('base', 'data', data);
%% RUNNING SIMULINK MODEL
filename = input('Which file? ', 's');

if (filename == 'P5p5d.slx')
%     number = input('Constant times Q_k: ');
%     Q_k = [30 0; 0 10^(-6)] * number;
%     %Push into workspace
%     assignin('base', 'Q_k', Q_k);
%     %Vary the struct
%     data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
%     %Push into workspace
%     assignin('base', 'data', data);
    sim('P5p5d.slx', 1000);
    figure;
    hold on;
    plot(compass_ref.time, compass_ref.signals.values, '--');
    %plot(rudder_comp.time, rudder_comp.signals.values,'-.c');
    legende = legend('Reference for compass angle');
    set(legende, 'FontSize', 6);
    title('Kalman feed forward')
    xlabel('Time[s]');
    ylabel('Degrees[deg]');
    xlim([0 500]);
    ylim ([0 40]);
    
    for i = 1:3
        number = input('Constant times Q_k: ');
        Q_k = [30 0; 0 10^(-6)] * number;
        %Push into workspace
        assignin('base', 'Q_k', Q_k);
        %Vary the struct
        data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
        %Push into workspace
        assignin('base', 'data', data);
        sim('P5p5d.slx', 1000);
        plot(compass.time, compass.signals.values, 'DisplayName', ['Measured compass angle, Q_k = Q_k*', num2str(number)]);
        %plot(compass_est.time, compass_est.signals.values, 'r');
        %plot(rudder.time, rudder.signals.values, 'DisplayName', ['Rudder input, Q_k = Q_k*', num2str(number)]);
        %plot(bias_est.time, bias_est.signals.values, 'DisplayName', ['Bias, Q_k = Q_k*', num2str(number)]);
    end 


else 
    sim('P5p5e.slx', 1000);
    figure;
    hold on;
    plot(compass_ref.time, compass_ref.signals.values, '--');
    %plot(rudder_comp.time, rudder_comp.signals.values,'-.c');
    legende = legend('Reference for compass angle');
    set(legende, 'FontSize', 6);
    title('Kalman feed forward')
    xlabel('Time[s]');
    ylabel('Degrees[deg]');
    xlim([0 500]);
    ylim ([0 40]);
    
    for i = 1:3
        number = input('Constant times Q_k: ');
        Q_k = [30 0; 0 10^(-6)] * number;
        %Push into workspace
        assignin('base', 'Q_k', Q_k);
        %Vary the struct
        data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
        %Push into workspace
        assignin('base', 'data', data);
        sim('P5p5e.slx', 1000);
        plot(compass.time, compass.signals.values, 'DisplayName', ['Measured compass angle, Q_k = Q_k*', num2str(number)]);
        %plot(compass_est.time, compass_est.signals.values, 'r');
        %plot(rudder.time, rudder.signals.values, 'DisplayName', ['Rudder input, Q_k = Q_k*', num2str(number)]);
        %plot(bias_est.time, bias_est.signals.values, 'DisplayName', ['Bias, Q_k = Q_k*', num2str(number)]);
    end 
end