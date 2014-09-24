%% Part 3a
% convert your data to units of volts by multiplying by the appropriate
% scale factor.
dataVolts = dataADC;

% plot the results
figure(2);clf;
plot(etime, dataVolts);
xlabel('Time (sec)');
ylabel('Spirometry signal (V)');
axis([0 seconds_to_record 0 5]);

%% Part 3b
% convert dataVolts to air flow rate
data_airFlow_rate = dataVolts;

figure(3);clf;
plot(etime, data_airFlow_rate);
xlabel('Time (sec)');
ylabel('Air flow rate (L/s)');
axis([0 seconds_to_record -17 17]);


