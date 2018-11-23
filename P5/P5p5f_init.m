%% GET REQUIRED MATRICES
run P5p5c_init.m

%% RUNNING SIMULINK MODEL
filename = input('Which file? ', 's');

if (filename == 'P5p5d.slx')
    sim('P5p5d.slx', 1000);
    figure;
    hold on;
    plot(compass_ref.time, compass_ref.signals.values, '--');
    %plot(rudder_comp.time, rudder_comp.signals.values,'-.c');
    legende = legend('Reference for compass angle');
    set(legende, 'FontSize', 6);
    title('Kalman feed forward')
    xlabel('Time[s]');
    ylabel('Angle[deg]');
    xlim([0 500]);
    ylim ([-20 45]);
    
    for i = 1:3
        %vary Q
        w_w = input('E[w_w^2]: ');
        w_b = input('E[w_b^2]: ');
        Q_k = [w_w 0; 0 w_b];
        %Push into workspace
        assignin('base', 'Q_k', Q_k);
        %Vary the struct
        data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
        %Push into workspace
        assignin('base', 'data', data);
        sim('P5p5d.slx', 1000);
        %plot(compass.time, compass.signals.values, 'DisplayName', ['Measured compass angle, E[w_w^2] = ', num2str(w_w), ' E[w_b^2] = ', num2str(w_b)]);
        plot(compass_est.time, compass_est.signals.values, 'DisplayName', ['Estimated compass angle, E[w_w^2] = ', num2str(w_w), ' E[w_b^2] = ', num2str(w_b)]);
        plot(rudder.time, rudder.signals.values, 'DisplayName', 'Rudder input');
        %plot(bias_est.time, bias_est.signals.values, 'DisplayName', ['Bias, Q_k = Q_k*', num2str(number)]);
    end 


else 
    sim('P5p5e.slx', 1000);
    figure;
    hold on;
    plot(compass_ref.time, compass_ref.signals.values, '--');
    plot(compass.time, compass.signals.values,'--c');
    legende = legend('Reference for compass angle', 'Measured angle');
    set(legende, 'FontSize', 6);
    title('Kalman feed forward')
    xlabel('Time[s]');
    ylabel('Angle[deg]');
    xlim([0 500]);
    ylim ([0 45]);
    
    for i = 1:3
        %vary Q
        w_w = input('E[w_w^2]: ');
        w_b = input('E[w_b^2]: ');
        Q_k = [w_w 0; 0 w_b];
        %Push into workspace
        assignin('base', 'Q_k', Q_k);
        %Vary the struct
        data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
        %Push into workspace
        assignin('base', 'data', data);
        sim('P5p5e.slx', 1000);
        %plot(compass.time, compass.signals.values, 'DisplayName', ['Measured compass angle, E[w_w^2] = ', num2str(w_w), ' E[w_b^2] = ', num2str(w_b)]);
        plot(compass_est.time, compass_est.signals.values, 'DisplayName', ['Estimated compass angle, E[w_w^2] = ', num2str(w_w), ' E[w_b^2] = ', num2str(w_b)]);
        plot(rudder.time, rudder.signals.values, 'DisplayName', 'Rudder input');
        %plot(bias_est.time, bias_est.signals.values, 'DisplayName', ['Bias, Q_k = Q_k*', num2str(number)]);
    end 
end