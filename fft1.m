% N point sequence in FFT
clc;
clear all;
close all;
x=input('Enter the sequence : ');
N=input('Enter the Point    : ');
n=length(x);
x=[x zeros(1,N-n)];
y=bitrevorder(x);
M=log2(N);
for m=1:M
    d=2^m;
    for l=1:d:N-d+1
        for k=0:(d/2)-1
            w=exp(-1i*2*pi*k/d);
            z1=y(l+k);
            z2=y(l+k+d/2);
            y(l+k)=z1+w*z2;
            y(l+k+d/2)=z1-w*z2;
        end
    end
end
disp(y);

subplot(3,1,1)
stem(abs(x));
title('Input Sequence');
subplot(3,1,2)
stem(abs(y));
title('Magnitude Response in FFT');
subplot(3,1,3)
stem(angle(y));
title('Phase Response in FFT');
