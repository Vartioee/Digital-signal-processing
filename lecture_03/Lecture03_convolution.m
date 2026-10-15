clear;
close all;
clc;

% Use the same random noise each time
rng(1);

%% Create a clean discrete-time signal
n = 0:100;
clean = sin(0.1*pi*n);

%% Add noise
noise = 0.4*randn(size(n));
measured = clean + noise;

%% Display the clean and noisy signals
figure();
plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.6 0.6 0.6]);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Clean and Noisy Signals');
legend('Clean Signal', 'Noisy Signal');
saveas(gcf, 'clean_and_noise.png');


%% Task 1: Amplitude Scaling
scaled = 2 * measured;

figure();
plot(n, measured, 'Color', [0.6 0.6 0.6], 'LineWidth', 1.2);
hold on;
plot(n, scaled, 'r', 'LineWidth', 1.5);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 1: Noisy vs. Scaled Signal');
legend('Noisy Signal', 'Scaled Signal (x2)');
saveas(gcf, 'signal_operations.png');

%% Task 2: Signal Delay
delay = 5;

% Prepend zeros to delay the signal by 5 samples
delayed = [zeros(1, delay), measured];

% Create sample index vectors for plotting
n_measured = 0:length(measured)-1;
n_delayed = 0:length(delayed)-1;

figure();
plot(n_measured, measured, 'Color', [0.6 0.6 0.6], 'LineWidth', 1.2);
hold on;
plot(n_delayed, delayed, 'm--', 'LineWidth', 1.5);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 2: Signal Delay by 5 Samples');
legend('Original Noisy Signal', 'Delayed Signal');
saveas(gcf, 'signal_delay.png');

%% Task 3: Five-Point Moving-Average Filter
h5 = ones(1,5)/5;

filtered5 = conv(measured, h5, 'same');

figure();
plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.7 0.7 0.7]);
plot(n, filtered5, 'r', 'LineWidth', 1.5);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 3: 5-Point Moving-Average Filtering');
legend('Clean Signal', 'Noisy Signal', '5-Point Filtered');
saveas(gcf, 'noise_filtering.png');

%% Task 4: Compare Two Filter Lengths
h15 = ones(1,15)/15;

filtered15 = conv(measured, h15, 'same');

figure();
plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.75 0.75 0.75]);
plot(n, filtered5, 'r', 'LineWidth', 1.5);
plot(n, filtered15, 'g--', 'LineWidth', 1.5);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 4: Comparison of 5-Point and 15-Point Moving-Average Filters');
legend('Clean Signal', 'Noisy Signal', '5-Point Filtered', '15-Point Filtered');
saveas(gcf, 'filter_comparison.png');