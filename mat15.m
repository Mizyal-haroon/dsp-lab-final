clc;
clf;
close all;
disp('---- 2. Linearity Property -----')

% Input sequences and scalar values
x1 = input('Enter the 1st sequence: ');
x2 = input('Enter the 2nd sequence: ');
a = input('Enter 1st scalar value a: ');
b = input('Enter 2nd scalar value b: ');

% DFT function
function X_k = dft(x)
    N = length(x);
    X_k = zeros(1, N); 
    for k = 0:N-1
        for n = 0:N-1
            X_k(k+1) = X_k(k+1) + x(n+1) * exp((-1i * 2 * pi * k * n) / N);
        end
    end
end

% Perform DFT on x1 and x2
y1 = dft(x1);
y2 = dft(x2);

% Check linearity property
Y1 = dft(a * x1 + b * x2); 
Y2 = a * y1 + b * y2;      

disp('DFT of a*x1 + b*x2');
disp( Y1);

disp('a*DFT(x1) + b*DFT(x2)');
disp(Y2);
% Compare the results
if max(abs(Y1 - Y2)) < 10^(-10)
    disp('Linearity property of DFT is verified');
else
    disp('Linearity property of DFT is not verified');
end
