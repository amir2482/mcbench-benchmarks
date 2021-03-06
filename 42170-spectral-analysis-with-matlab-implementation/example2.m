clear all,  close all

fs = 44.1e3;
t = 0:1/fs:1;
x1 = sin(2*pi*1000*t);
x2 = sin(2*pi*5000*t);
x = x1 + x2 + 0.5*randn(1, length(x1));
sound(x, fs)

[Xamplitude, XPhase, freq] = spectrum(x, fs);

figure(1)
plot(freq/1000, Xamplitude); 
grid on
xlim([0 max(freq/1000)])
ylim([-150 max(Xamplitude)+10])
title('Amplitude spectrum of the signal'); 
xlabel('Frequency, kHz'); 
ylabel('Magnitude, dB'); 
