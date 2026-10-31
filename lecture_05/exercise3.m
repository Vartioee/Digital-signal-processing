fs = 200;
d = 4; 
f2 = 13.2 + 0.17*d; 

% 1-second recording
t1 = 0:1/fs:1-1/fs;
x1 = 0.8*sin(2*pi*15*t1) + 0.4*sin(2*pi*f2*t1);
N1 = length(x1);
f_1 = fs*(0:N1/2)/N1;
P1_1 = compute_spectrum(x1, N1);

% 4-second recording
t4 = 0:1/fs:4-1/fs;
x4 = 0.8*sin(2*pi*15*t4) + 0.4*sin(2*pi*f2*t4);
N4 = length(x4);
f_4 = fs*(0:N4/2)/N4;
P1_4 = compute_spectrum(x4, N4);

% Zero-padded recording (1-second signal padded to 4*N1)
N_pad = 4 * N1;
f_pad = fs*(0:N_pad/2)/N_pad;
P1_pad = compute_spectrum(x1, N_pad);

% Plotting
figure;
subplot(3,1,1); plot(f_1, P1_1); xlim([0 25]); title('1-Second Recording');
subplot(3,1,2); plot(f_4, P1_4); xlim([0 25]); title('4-Second Recording');
subplot(3,1,3); plot(f_pad, P1_pad); xlim([0 25]); title('Zero-Padded 1-Second Recording');

function P1 = compute_spectrum(x, N_fft)
Y = fft(x, N_fft);
P2 = abs(Y/length(x)); 
P1 = P2(1:N_fft/2+1);
P1(2:end-1) = 2*P1(2:end-1);
end