clc;
close all;
disp('------4. Time Shifting Property----')

% Input sequence and shift value
x1 = input('Enter the sequence x1 as a vector (e.g., [1, 2, 3, 4]): ');
m = input('Enter the shift m: ');

% Length of the sequence
N = length(x1);

% User-defined function to compute DFT of a sequence
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

% Generate the time-shifted version of the sequence using circshift
x2 = circshift(x1', m);  

% Computing the DFT of the time-shifted sequence x2
y2 = dft(x2);

% Calculating the DFT of the time-shifted sequence 
for k = 1:N
    y(k) = y1(k) * exp((-1i * 2 * pi * (k-1) * m) / N);  
end

% Display the results
disp('DFT of x(n): ');
disp(y1');

disp('DFT of x(n-m) by direct method: ');
disp(y2');

disp('DFT of x(n-m) by property: ');
disp(y');

% Verify the time-shifting property by comparing the two DFT results
if max(abs(y - y2)) < 10^(-10)
    disp('Time shifting property of DFT is verified');
else
    disp('Time shifting property of DFT is not verified');
end

