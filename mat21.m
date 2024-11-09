clc;
clf;
close all;
disp('------ 8. Parseval''s Theorem -----');

% Input the sequence
x = input('Enter the sequence: ');

% Length of the sequence
N = length(x);

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

% Compute the DFT of the sequence
y = dft(x);

% Compute the sum of the squared magnitudes of the sequence in time domain
X = sum(abs(x) .^ 2);
Y = sum(abs(y) .^ 2) / N;

% Display results
disp('DFT of x: ');
disp(y');

disp('Sum of |x|^2 (time domain): ');
disp(X);

disp('1/N * Sum of |DFT(x)|^2 (frequency domain): ');
disp(Y);

% Verify Parseval's Theorem by comparing the two sums
if abs(X - Y) < 10^(-10)
    disp('Parseval''s Theorem of DFT is verified');
else
    disp('Parseval''s Theorem of DFT is not verified');
end
