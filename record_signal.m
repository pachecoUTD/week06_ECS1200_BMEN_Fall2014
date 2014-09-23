% Before running this code, connect to the Arduino using the command
% a = arduino('COM3'); 
% Note: your COM port may be different

% how many seconds of data to record
seconds_to_record = 20;

% sampling rate in Hz
sampling_rate = 10;

% time between samples
pause_time = 1/sampling_rate;

fprintf('Ready to record. Press enter to start recording...');
pause
fprintf('\n');

% the Matlab function 'now' returns the current time in Matlab serial 
% time which has units of days. To convert to seconds, you must therefore
% multiple by 24 hours/day * 3600 seconds/hour = 86400 seconds / day

% Save the current time
time0 = now;

% To convert Matlab serial time to a readable format you can use the datestr function
fprintf('Matlab serial start time %0.7f is %s\n', time0, datestr(time0));

%% Part 2
% Write a while loop that records data from the spirometer for the specified 
% duration. Store the data in a vector named 'dataADC'. For each data sample, 
% record the elapsed time (in seconds) in a vector named 'etime'

% initialize etime and data vectors
etime = []; 
dataADC = [];

figure(1);clf;
hold on;
while ((now-time0)*24*3600) < ??
    
    % read spirometer signal from analog channel 0
    dataV = analogRead(a, ??);
    timeV = now;

    % update data vector using array concatenation
    data = [data ??];
    
    % update etime vector using array concatenation
    etime = [etime (timeV-time0)*24*3600];

    % plot the data you have collected so far
    figure(1);
    plot(etime, dataADC);
    axis([0 seconds_to_record 0 1023]);

    % force Matlab to update the plot
    drawnow;
        
    % pause for fixed time
    pause(pause_time);
end


%% Part 3a
% convert your data to units of volts by multiplying by the appropriate
% scale factor. Hint: ADC
dataVolts = dataADC;

% plot the results
figure(2);clf;
plot(etime, dataVolts);
xlabel('Time (sec)');
ylabel('Spirometetry signal (V)');
axis([0 seconds_to_record 0 5]);

%% Part 3b
% convert dataVolts to air flow rate
data_airFlow_rate = dataVolts;

figure(3);clf;
plot(etime, data_airFlow_rate);
xlabel('Time (sec)');
ylabel('Air flow rate (L/s)');
axis([0 seconds_to_record -17 17]);



