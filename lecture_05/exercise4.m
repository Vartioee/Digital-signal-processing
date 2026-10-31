x = [1 1 1 1];
n = 0:length(x)-1;

% DTFT
w = linspace(-pi, pi, 1000);
X = x * exp(-1j * (n.' * w));

% DFT (N=4 and N=64)
X4 = fft(x, 4);
w4 = linspace(0, 2*pi, 4+1); w4(end) = []; w4(w4>=pi) = w4(w4>=pi) - 2*pi; 
X4 = fftshift(X4); w4 = sort(w4);

X64 = fft(x, 64);
w64 = linspace(0, 2*pi, 64+1); w64(end) = []; w64(w64>=pi) = w64(w64>=pi) - 2*pi;
X64 = fftshift(X64); w64 = sort(w64);

figure;
plot(w, abs(X), 'b', 'LineWidth', 1.5)
hold on
stem(w4, abs(X4), 'r', 'LineWidth', 1.5)
scatter(w64, abs(X64), 'k.')
grid on
xlabel('Angular frequency (rad/sample)')
ylabel('Magnitude')
legend('DTFT', 'DFT (N=4)', 'DFT (N=64)')