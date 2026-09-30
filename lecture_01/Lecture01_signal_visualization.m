
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second duration)

% Define arrays for 3 amplitudes and 3 frequencies
amplitudes = [0.50, 1, 2];
frequencies = [2, 5, 10]; 

% Generate the clean sine wave
y_clean = amplitudes(2) * sin(2 * pi * frequencies(2) * t);

% Generate noise and add it to the clean signal
noise_level = 0.67;      % Adjust this to make the noise stronger or weaker
noise = noise_level * randn(size(t)); 
y_noisy = y_clean + noise;

% Create the figure and subplots
figure;

% --- Top Subplot: Clean Signal ---
subplot(2, 1, 1);       % (2 rows, 1 column, position 1)
plot(t, y_clean, 'LineWidth', 1.5);
title(sprintf('Clean %.f Hz Sine Wave', frequencies(2)));
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% --- Bottom Subplot: Noisy Signal ---
subplot(2, 1, 2);       % (2 rows, 1 column, position 2)
plot(t, y_noisy, 'r', 'LineWidth', 1.2); % 'r' makes the line red
title('Sine Wave with Added White Noise');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% 4. Loop to generate and plot each wave
% for i = 1:3
%     y = amplitudes(2) * sin(2 * pi * frequencies(2) * t);
% 
%     % Create the subplot grid (3 rows, 1 column, plot at position i)
%     subplot(3, 1, i);
% 
%     % Plot the signal
%     plot(t, y, 'LineWidth', 1.5);
% 
%     % Apply formatting
%     title(sprintf('Sine Wave: Amplitude = %.2f, Frequency = %.2f Hz', amplitudes(2), frequencies(2)));
%     xlabel('Time (seconds)');
%     ylabel('Amplitude');
%     grid on;
% end


