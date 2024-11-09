clc;
clf;
close all;

% Define the input sequences
x = input('Enter the 1st sequence x[n] as a vector (e.g., [1, 2, 3, 4]): ');
h = input('Enter the 2nd sequence h[n] as a vector (e.g., [1, 2, 3, 4]): ');

% Calculate the length of the sequences
N1 = length(x);
N2 = length(h);

% The length of the linear convolution
N = N1 + N2 - 1;

% Zero-pad both sequences to the length of the linear convolution
x_padded = [x, zeros(1, N - N1)];
h_padded = [h, zeros(1, N - N2)];

y_circular = zeros(1, N);

% Perform circular convolution manually using the mod function
for i = 1:N
    y_sum = 0;
    for j = 1:N1
        index = mod(i - j, N) + 1;  
        if index <= N2
            y_sum = y_sum + x_padded(j) * h_padded(index);
        end
    end
    y_circular(i) = y_sum;
end

% Calculate linear convolution using built-in function
y_builtin = conv(x, h);

% Display the results
disp('Linear Convolution using Circular Convolution:');
disp(y_circular);

disp('Linear Convolution using built-in "conv" function:');
disp(y_builtin);


% Plot input sequence x[n]
subplot(3,2,1);
stem(x, 'filled', 'LineWidth', 1.5);
title('Input Sequence x[n]');
xlabel('n');
ylabel('x[n]');
grid on;































































% Plot input sequence h[n]
subplot(3,2,2);
stem(h, 'filled', 'LineWidth', 1.5);
title('Input Sequence h[n]');
xlabel('n');
ylabel('h[n]');
grid on;


% Plot padded x sequence
subplot(3,2,3);
stem(x_padded, 'filled', 'LineWidth', 1.5);
title('Padded x[n]');
xlabel('n');
ylabel('x_padded[n]');
grid on;

% Plot padded h sequence
subplot(3,2,4);
stem(h_padded, 'filled', 'LineWidth', 1.5);
title('Padded h[n]');
xlabel('n');
ylabel('h_padded[n]');
grid on;

% Plot circular convolution result (concentric circles method)
subplot(3,2,5);
stem(y_circular, 'filled', 'LineWidth', 1.5);
title('Circular Convolution Concentric Circles');
xlabel('n');
ylabel('y[n]');
grid on;

% Plot circular convolution result (built-in function)
subplot(3,2,6);
stem(y_builtin, 'filled', 'LineWidth', 1.5);
title('Circular Convolution Built-in');
xlabel('n');
ylabel('y[n]');
grid on;

