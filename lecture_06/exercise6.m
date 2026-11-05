
clear; clc; close all;

%% ========================================================================
% PART A: Filter a sensor signal
% =========================================================================
% 1. Setup Signal
Fs = 1000;
t = (0:1/Fs:2-1/Fs)';
rng(7);
clean = sin(2*pi*5*t) + 0.35*sin(2*pi*12*t);
noise = 0.35*sin(2*pi*50*t) + 0.20*sin(2*pi*137*t) + 0.25*randn(size(t));
x = clean + noise;

% 2. Design Filters (20 Hz Cutoff)
fc = 20;
bFIR = fir1(60, fc/(Fs/2), 'low');
[bIIR, aIIR] = butter(4, fc/(Fs/2), 'low');

% 3. Apply Filters using filtfilt (Zero-phase)
yFIR = filtfilt(bFIR, 1, x);
yIIR = filtfilt(bIIR, aIIR, x);

% --- Part A Task 1: Time Domain Plot (0.2 s section) ---
fig1 = figure('Name', 'Part A: Time Domain Comparison');
idx = t <= 0.2;
plot(t(idx), clean(idx), 'k', 'LineWidth', 1.5); hold on;
plot(t(idx), x(idx), 'Color', [0.7 0.7 0.7]);
plot(t(idx), yFIR(idx), 'b--', 'LineWidth', 1.5);
plot(t(idx), yIIR(idx), 'r:', 'LineWidth', 1.5);
legend('Clean Signal', 'Noisy Signal', 'FIR Output (Order 60)', 'IIR Output (Order 4)');
xlabel('Time (s)'); ylabel('Amplitude (V)'); 
title('Part A: Sensor Time-Domain Comparison (0 to 0.2s)');
grid on;
saveas(fig1, 'PartA_TimeDomain.png');

% --- Part A Task 2: Magnitude Responses ---
fig2 = figure('Name', 'Part A: Filter Frequency Responses');
[hFIR, wFIR] = freqz(bFIR, 1, 1024, Fs);
[hIIR, wIIR] = freqz(bIIR, aIIR, 1024, Fs);
plot(wFIR, 20*log10(abs(hFIR)), 'b', 'LineWidth', 1.5); hold on;
plot(wIIR, 20*log10(abs(hIIR)), 'r', 'LineWidth', 1.5);
xline(fc, 'k--', '20 Hz Cutoff', 'LabelVerticalAlignment', 'bottom');
legend('FIR Filter', 'IIR Filter');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)'); 
title('Part A: Filter Frequency Responses');
ylim([-100 10]); grid on;
saveas(fig2, 'PartA_FrequencyResponses.png');

% --- Part A Task 3: Single-Sided Amplitude Spectra ---
L = length(x);
nPointsA = floor(L/2) + 1;
f = Fs*(0:(nPointsA-1))/L;

% Compute FFTs and single-sided amplitudes
P1_x = abs(fft(x)/L);       P1_x = P1_x(1:nPointsA);       P1_x(2:end-1) = 2*P1_x(2:end-1);
P1_FIR = abs(fft(yFIR)/L);  P1_FIR = P1_FIR(1:nPointsA);   P1_FIR(2:end-1) = 2*P1_FIR(2:end-1);
P1_IIR = abs(fft(yIIR)/L);  P1_IIR = P1_IIR(1:nPointsA);   P1_IIR(2:end-1) = 2*P1_IIR(2:end-1);

fig3 = figure('Name', 'Part A: Sensor Spectra');
plot(f, P1_x, 'Color', [0.7 0.7 0.7]); hold on;
plot(f, P1_FIR, 'b--', 'LineWidth', 1.5);
plot(f, P1_IIR, 'r:', 'LineWidth', 1.5);
xlim([0 200]); % Focus on the frequencies of interest
legend('Noisy Input', 'FIR Output', 'IIR Output');
xlabel('Frequency (Hz)'); ylabel('Amplitude'); 
title('Part A: Single-Sided Amplitude Spectra');
grid on;
saveas(fig3, 'PartA_SensorSpectra.png');

% --- Part A Task 4: RMSE Calculation ---
rmse_noisy = sqrt(mean((x - clean).^2));
rmse_FIR = sqrt(mean((yFIR - clean).^2));
rmse_IIR = sqrt(mean((yIIR - clean).^2));
fprintf('--- Part A: RMSE Results ---\n');
fprintf('Noisy input: %.4f\n', rmse_noisy);
fprintf('FIR output:  %.4f\n', rmse_FIR);
fprintf('IIR output:  %.4f\n\n', rmse_IIR);

%% ========================================================================
% PART B: Reduce a 50 Hz hum in audio
% =========================================================================
% 1. Setup Audio Signal
load handel; % loads y and Fs
xClean = y;  
tAudio = (0:numel(xClean)-1)'/Fs;
xHum = xClean + 0.15*sin(2*pi*50*tAudio);

% 2. Design Narrow Band-stop Filter (49-51 Hz)
[bN, aN] = butter(2, [49 51]/(Fs/2), 'stop');
yAudio = filtfilt(bN, aN, xHum);

% --- Part B Task 1: Waveform Comparison ---
fig4 = figure('Name', 'Part B: Audio Waveform Comparison');
idx_aud = (tAudio >= 1.0) & (tAudio <= 1.2); % 0.2s snippet to see waveforms
subplot(3,1,1); plot(tAudio(idx_aud), xClean(idx_aud), 'k'); 
title('Clean Audio'); ylabel('Amplitude'); grid on;
subplot(3,1,2); plot(tAudio(idx_aud), xHum(idx_aud), 'r'); 
title('Audio + 50Hz Hum'); ylabel('Amplitude'); grid on;
subplot(3,1,3); plot(tAudio(idx_aud), yAudio(idx_aud), 'b'); 
title('Filtered Audio (49-51 Hz Notch)'); xlabel('Time (s)'); ylabel('Amplitude'); grid on;
saveas(fig4, 'PartB_AudioWaveforms.png');

% --- Part B Task 2: Audio Spectra ---
L_aud = length(xClean);
nPointsB = floor(L_aud/2) + 1; % Fixed: ensures integer index when L_aud is odd (7311 samples)
f_aud = Fs*(0:(nPointsB-1))/L_aud;

P1_aud_clean = abs(fft(xClean)/L_aud); P1_aud_clean = P1_aud_clean(1:nPointsB); P1_aud_clean(2:end-1) = 2*P1_aud_clean(2:end-1);
P1_aud_hum   = abs(fft(xHum)/L_aud);   P1_aud_hum   = P1_aud_hum(1:nPointsB);   P1_aud_hum(2:end-1)   = 2*P1_aud_hum(2:end-1);
P1_aud_filt  = abs(fft(yAudio)/L_aud); P1_aud_filt  = P1_aud_filt(1:nPointsB);  P1_aud_filt(2:end-1)  = 2*P1_aud_filt(2:end-1);

fig5 = figure('Name', 'Part B: Audio Spectrum');
plot(f_aud, P1_aud_clean, 'k', 'LineWidth', 1); hold on;
plot(f_aud, P1_aud_hum, 'r:', 'LineWidth', 1.5);
plot(f_aud, P1_aud_filt, 'b--', 'LineWidth', 1.5);
xlim([0 200]); % Zoom in to see the 50 Hz hum clearly
legend('Clean', 'With 50Hz Hum', 'Narrow Filtered');
xlabel('Frequency (Hz)'); ylabel('Amplitude'); 
title('Part B: Audio Spectra (Zoomed to 0-200 Hz)');
grid on;
saveas(fig5, 'PartB_AudioSpectrum.png');

% --- Part B Task 3: Playback (Uncomment to listen) ---
% disp('Playing Audio with 50 Hz Hum...');
% sound(xHum, Fs);
% pause(length(xHum)/Fs + 1);
% disp('Playing Filtered Audio...');
% sound(yAudio, Fs);

% --- Part B Task 4: Measure 50 Hz Amplitude ---
% Find the frequency bin closest to 50 Hz
[~, idx50] = min(abs(f_aud - 50));
amp_before = P1_aud_hum(idx50);
amp_after  = P1_aud_filt(idx50);
fprintf('--- Part B: 50 Hz Amplitude Measurement ---\n');
fprintf('Amplitude at 50Hz BEFORE filtering: %.4f\n', amp_before);
fprintf('Amplitude at 50Hz AFTER filtering:  %.4f\n\n', amp_after);

% --- Part B Task 5: Wider Stop Band Comparison (45-55 Hz) ---
[bW, aW] = butter(2, [45 55]/(Fs/2), 'stop');
yAudio_wide = filtfilt(bW, aW, xHum);
P1_aud_wide = abs(fft(yAudio_wide)/L_aud); 
P1_aud_wide = P1_aud_wide(1:nPointsB); 
P1_aud_wide(2:end-1) = 2*P1_aud_wide(2:end-1);

fig6 = figure('Name', 'Part B: Wide vs Narrow Filter Spectrum');
plot(f_aud, P1_aud_clean, 'k'); hold on;
plot(f_aud, P1_aud_filt, 'b');
plot(f_aud, P1_aud_wide, 'g--');
xlim([0 150]); 
legend('Clean', 'Narrow Notch (49-51 Hz)', 'Wide Notch (45-55 Hz)');
xlabel('Frequency (Hz)'); ylabel('Amplitude'); 
title('Part B: Stop Band Comparison (Zoomed to 0-150 Hz)');
grid on;
saveas(fig6, 'PartB_StopBandComparison.png');