n1=input('Enter starting point of the signal');
n2=input('Enter ending pont of the signal');
Sample_points=-n1:1:n2;
Amp_1=zeros(1,n1+1);
for(i=1:n2)
    Amp_2(i)=i;
end
Amp_2;
Amplitude=[Amp_1 Amp_2];

subplot(1,2,1);
plot(Sample_points,Amplitude);
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('Continous Ramp Signal');

subplot(1,2,2);
stem(Sample_points,Amplitude);
grid on;
xlabel('Samples');
ylabel('Amplitude');

title('Discrete Ramp Signal');