clc;
clf;
clear;
close all;

wc1 = 0.25 * pi;  
wc2 = 0.75 * pi; 
wc = 0.5 * pi;
N = input('Enter the value of N: '); 
alpha = (N - 1) / 2;  
eps = 0.001; 
n = 0 : N-1;  

% impulse responses
% Low-pass Filter
hd_lowpass = (sin(wc1*(n - alpha + eps))) ./ (pi * (n - alpha + eps)); 

%high pass Filter
hd_highpass= (sin(pi*(n - alpha + eps)) - sin(wc*(n - alpha + eps)))./(pi*(nalpha+eps));

% Band-pass Filter
hd_bandpass = (sin(wc2*(n - alpha + eps)) - sin(wc1*(n - alpha + eps))) ./ (pi * (n -         alpha + eps));  

% Band-reject Filter
hd_bandstop= (sin(wc2*(n - alpha + eps)) - sin(wc1*(n - alpha + eps) +sin(pi*(n-alpha+eps)))) ./ (pi * (n - alpha + eps));

% Window Function
wr_rectangular = boxcar(N);  % Rectangular window

% Apply Window Functions to the Ideal Impulse Responses
hn_lowpass = hd_lowpass .* wr_rectangular'; 
hn_highpass = hd_highpass .* wr_rectangular'; 
hn_bandpass = hd_bandpass .* wr_rectangular'; 
hn_bandstop = hd_bandstop .* wr_rectangular'; 

% FREQUENCY RESPONSE for each filter
w = 0:0.01:pi;  
h_lowpass = freqz(hn_lowpass, 1, w);  
h_highpass = freqz(hn_highpass, 1, w);  
h_bandpass = freqz(hn_bandpass, 1, w);  
h_bandstop = freqz(hn_bandstop, 1, w);  

% LOW-PASS FILTER PLOT
subplot(3, 2, 1);
plot(w/pi, 20*log10(abs(h_lowpass)));  
title('LOW PASS FILTER USING RECTANGULAR WINDOW');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
grid on;

% HIGH-PASS FILTER PLOT
subplot(3, 2, 2);
plot(w/pi, 20*log10(abs(h_highpass)));  
title('HIGH PASS FILTER USING RECTANGULAR WINDOW');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
grid on;

% BAND-PASS FILTER PLOT
subplot(3, 2, 3);
plot(w/pi, 20*log10(abs(h_bandpass)));  
title('BAND PASS FILTER USING RECTANGULAR WINDOW');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
grid on;

% BAND-REJECT FILTER PLOT
subplot(3, 2, 4);
plot(w/pi, 20*log10(abs(h_bandstop)));  
title('BAND REJECT FILTER USING RECTANGULAR WINDOW');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
grid on;

% RECTANGULAR WINDOW SEQUENCE PLOT
subplot(3, 2, 5);
stem(n, wr_rectangular, 'filled');
title('Rectangular Window Sequence');
xlabel('n (Sample Index)');
ylabel('Amplitude');
grid on;
