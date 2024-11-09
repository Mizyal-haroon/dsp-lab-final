clc;
clf;
clear all;
close all;

Am=input('Enter amplitude');
N=input('Enter number of sampling points');
Dc_fact=input('Enter decaying factor');

Sample_points=0:1:N-1;
Amplitude=Am*exp(-Dc_fact*Sample_points);

subplot(1, 2 ,1);

plot(Sample_points,Amplitude);
grid on;
xlabel('time');
ylabel('Amplitude');
title('Continous exponential signal');

subplot(1 ,2 ,2);

stem(Sample_points,Amplitude);
grid on;
xlabel('samples');
ylabel('Amplitude');
title('Discrete exponential signal');
