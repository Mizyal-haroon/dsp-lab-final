clc;
clf;
close all;

% Input the sequence from the user
x = input('Enter the sequence as a vector (e.g., [1, 2, 3, 4]):');

% Calculate the length of the input sequence
N = length(x);
x = [x x];

% Initialize the output array for DFT calculation
y = zeros(1, 2*N);

% Compute the DFT for the two periods
for k = 1 : 2 * N
    for n = 1 : N
        y(k) = y(k) + exp(-1i * 2 * pi * (k-1) * (n-1)/N) * x(n);
    end
end

% Display the DFT results for the 1st period (1 to N)
disp('DFT of input in 1st period (1 to N): ');
disp((y(1 : N))');

% Display the DFT results for the 2nd period (N+1 to 2N)
disp('DFT of input in 2nd period (N+1 to 2N): ');
disp((y(N+1 : 2*N))');

% Verify the periodicity property of the DFT
if abs(y(1 : N) - y(N+1 : 2*N)) < 10^(-10)
    disp('Periodicity Property of DFT is verified');
else
    disp('Periodicity Property of DFT is not verified');
end
