clc;
clf;
clear;
close all;

x = input('Enter 1st Sequence X(n)= ');
h = input('Enter 2nd Sequence H(n)= ');
N = input('Enter length of each block L = ');

% Padding
length_x = length(x);
length_h = length(h);
m = length_h - 1;  

% Overlap-save method
x = [zeros(1,m) x zeros(1,N)];  
h = [h zeros(1,N - length_h)];          
L = N - length_h + 1;          
k = floor((length(x) - m) / L);
p = [];

% Perform the overlap-save method
for i = 0:k-1
    y = x(i*L+1 : i*L+N);  
    fprintf('Block %d: ', i+1);
    disp(y);               
    q = circonv(y, h);  
    p = [p, q(length_h:end)];
end

% Trimming the result
trimmed_p = p(1:length_x + length_h - 1);
disp('Convolution using Overlap-Save method:');
disp(trimmed_p);

% Builtin convolution
conv_builtin = conv(x(m+1 : end-m), h(1 : length_h));  
conv_builtin = conv_builtin(1:length_x + length_h - 1);
disp('Convolution using builtin function:');
disp(conv_builtin);

% PLOT overlap-save output
stem(trimmed_p, 'filled');
xlabel('n');
ylabel('Amplitude');
title('convolution using overlap save method');

stem(conv_builtin, 'filled');
xlabel('n');
ylabel('Amplitude');
title('convolution using builtin function');

% FUNCTION FOR CIRCULAR CONVOLUTION
function y = circonv(x, h)
    N = length(x);  
    X = fft(x, N);
    H = fft(h, N);
    Y = X .* H;
    y = ifft(Y, N);
end
