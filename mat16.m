clc;
clf;
close all;
disp('------3. Time Reversal Property----')

% Input sequence
x1 = input('Enter the sequence: ');

% DFT function to compute the Discrete Fourier Transform
function X_k = dft(x)
    N = length(x);             
    X_k = zeros(1, N);         
    for k = 0:N-1
        for n = 0:N-1
            X_k(k+1) = X_k(k+1) + x(n+1) * exp((-1i * 2 * pi * k * n) / N); 
        end
    end
end

% Length of the input sequence
N = length(x1);

% Compute the DFT of the original sequence x1
y1 = dft(x1);

% Generate the time-reversed version of the sequence
n = 1:N-1;
x2(1) = x1(1);                
x2(n+1) = x1(N-(n-1));       

% Compute the DFT of the time-reversed sequence x2
y2 = dft(x2);

% Calculate the expected DFT of the time-reversed sequence using the property
y(1) = y1(1);                 
y(n+1) = y1(N-(n-1));         

% Display the results
disp('DFT of x(n): ');
disp(y1');

disp('DFT of x(N-n): ');
disp(y2');

disp('DFT of x(N-n) by property: ');
disp(y');

% Verify the time reversal property by comparing the two DFT results
if abs(y - y2) < 10^(-10)
    disp('Time reversal property of DFT is verified');
else
    disp('Time reversal property of DFT is not verified');
end

