clc;  
clf;  
clear;  
close all;

x = input('Enter the First Sequence, x(n) : = ');  
h = input('Enter the Second Sequence, h(n) : = ');  
M = length(x);  
N = length(h);  

% Padding
x = [x, zeros(1, N)];  

% CHECK IF THE FIRST SEQUENCE IS LONGER THAN THE SECOND
if (M > N)
    s = [s, zeros(1, M + (2 * N) - 1)];
    % PERFORM OVERLAP-ADD METHOD
    for (i = 1 : N : M)
        a = x(i : i + N - 1);  
        s1 = convdft(a, h);  
        s(i : i + (2 * N) - 2) = s(i : i + (2 * N) - 2) + s1;  
    end
end

% overlap add method output
y = s(1 : M + N - 1);  
disp('LC using overlap add method');
disp(y);  

% builtin function output
conv_builtin = conv(x, h);  
conv_builtin = conv_builtin(1 : M + N - 1);
disp('LC using builtin function');
disp(conv_builtin); 

%Plotting the output
subplot(2,1,1)
stem(y,'filled')
xlabel('n');
ylabel('Amplitude');
title('Convolution using overlap add method')

subplot(2,1,2)
stem(conv_builtin,'filled')
xlabel('n');
ylabel('Amplitude');
title('Convolution using builtin function')

% FUNCTION FOR DFT-BASED CONVOLUTION
function h = convdft(x, y)
    n1 = length(x);  
    n2 = length(y);    
    x = [x, zeros(1, n2 - 1)];  
    y = [y, zeros(1, n1 - 1)];  
    dx = fft(x);  
    dy = fft(y);  
    mul = dx .* dy;   
    h = ifft(mul);  
end
