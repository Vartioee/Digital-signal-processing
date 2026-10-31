t = linspace(-1, 1, 4000);
H_vals = [1, 3, 9, 25];
figure;

for i = 1:length(H_vals)
    H = H_vals(i);
    x = zeros(size(t));
    for k = 1:2:H
        x = x + (4/pi) * sin(2*pi*k*t) / k;
    end

    subplot(2, 2, i)
    plot(t, x)
    grid on
    xlabel('Time (s)')
    ylabel('Amplitude')
    title(['H = ', num2str(H)])
end