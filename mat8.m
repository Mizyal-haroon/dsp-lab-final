clc;
clf;
clear all;
close all;

Am=input('Enter amplitude');
f=input('Enter frequency');
c=input('Enter number of cycles ');
t=0:(1/(50*f)):c/f;


Amplitude=Am*square(2*pi*f*t,10);

subplot(1,2,1)

plot(t,Amplitude);
grid on;
xlabel('time');
ylabel('Amplitude');
title('Continous square signal');

subplot(1 ,2 ,2);

stem(t,Amplitude);
grid on;
xlabel('samples');
ylabel('Amplitude');
title('Discrete square signal');

