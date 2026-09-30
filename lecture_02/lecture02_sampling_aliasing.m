% Condition Monitoring System - Signal Sampling & Aliasing Analysis
clear; clc; close all;

% Create Original Signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second duration)
freq = 10;
original = 2 * sin(2 * pi * freq * t);

% Plot original signal
figure;
plot(t, original, 'b-', 'LineWidth', 1.5);
grid on;
title('Task 1: Original Continuous 10 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Continuous Signal (10 Hz)', 'Location', 'northeast');
saveas(gcf, 'original_signal.png');

% Investigate Different Sampling Frequencies (5 Subplots)
fs_array = [15, 20, 25, 50, 100];
figure;

for i = 1:5
    fs_m = fs_array(i);
    t_m = 0:1/fs_m:1;
    sample = 2 * sin(2 * pi * freq * t_m);

    subplot(5, 1, i);
    % Plot original continuous reference
    plot(t, original, 'b--', 'LineWidth', 1.0); hold on;
    % Overlay sampled discrete points and reconstructed linear profile
    stem(t_m, sample, 'r', 'LineWidth', 1.2, 'MarkerFaceColor', 'r');
    plot(t_m, sample, 'r:', 'LineWidth', 1.0); hold off;

    grid on;
    title(sprintf('Sampling Frequency = %d Hz', fs_m));
    xlabel('Time (s)');
    ylabel('Amplitude');
    legend('Continuous (10 Hz)', 'Sampled Points', 'Reconstructed Profile', 'Location', 'northeast');
    ylim([-2.0, 2.0]);
end

% Save combined 5-subplot figure
saveas(gcf, 'sampling_investigation.png');