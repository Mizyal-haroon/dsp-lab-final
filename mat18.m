clc;
clf;
close all;
disp('----- 5. Frequency Shifting Property -----');

% Input sequence and frequency shift value
x1 = input('Enter the sequence as a vector (e.g., [1, 2, 3, 4]): ');
m = input('Enter the frequency shift m: ');

% Length of the input sequence
N = length(x1);

% User-defined function to compute the DFT of a sequence
function X_k = dft(x)
    N = length(x);             
    X_k = zeros(1, N);         
    for k = 0:N-1
        for n = 0:N-1
            X_k(k+1) = X_k(k+1) + x(n+1) * exp((-1i * 2 * pi * k * n) / N);
        end
    end
end

% Compute DFT of the original sequence x1
y1 = dft(x1);

% Generate the frequency-shifted version of the sequence
for n = 1:N
    x_fshift(n) = exp(1i * 2 * pi * m * (n - 1) / N) * x1(n);
end

% Compute DFT of the frequency-shifted sequence
y2 = dft(x_fshift);

% Compute the DFT of the original sequence and shift it by m in the frequency domain
y = circshift(y1', m);  

% Display the results
disp('DFT of x(n): ');
disp(y1');

disp('DFT of e^(j2πmn/N) * x(n) by direct method: ');
disp(y2');

disp('DFT of e^(j2πmn/N) * x(n) by property (shifted): ');
disp(y);

% Verify the frequency shifting property by comparing the two DFT results
if max(abs(y' - y2)) < 10^(-10)
    disp('Frequency shifting property of DFT is verified');
else
    disp('Frequency shifting property of DFT is not verified');
end

