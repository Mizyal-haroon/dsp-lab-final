clc;
clf;
close all;
disp('------ 7. Multiplication (Modulation) Property -----');

% Input the two sequences
x1 = input('Enter the 1st sequence: ');
x2 = input('Enter the 2nd sequence: ');

% Lengths of the sequences
N = length(x1);
M = length(x2);

% Zero-padding the shorter sequence to match the length of the longer sequence
x1 = [x1, zeros(1, M-N)];
x2 = [x2, zeros(1, N-M)];

x = x1 .* x2;

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

% Compute the DFTs of the sequences x1 and x2
y1 = dft(x1);
y2 = dft(x2);

% Circular convolution of the DFTs of x1 and x2 divided by N
y = cconv(y1, y2, max(N, M)) / N;
Y = dft(x);

% Display the results
disp('DFT of x1: ');
disp(y1');

disp('DFT of x2: ');
disp(y2');

disp('DFT of multiplication of x1 and x2 (direct method): ');
disp(Y');

disp('DFT of multiplication of x1 and x2 by property: ');
disp(y');

if max(abs(y - Y)) < 10^(-10)
    disp('Multiplication property of DFT is verified');
else
    disp('Multiplication property of DFT is not verified');
end
