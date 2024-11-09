clc;
clf;
clear all;
close all
n1=input('Enter starting point of the signal');
n2=input('Enter ending pont of the signal');
Sample_points=-n1:1:n2;
Amplitude=[zeros(1,n1) ones(1,n2+1)];

subplot(1,2,1);
stem(Sample_points,Amplitude);
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('Discrete Step signal');

subplot(1,2,2);
plot(Sample_points,Amplitude);
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('Continous Step signal');