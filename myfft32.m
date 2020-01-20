function X = myfft32(x)
%% calculate the DFT of a complex vector of length 32
   
 %verify length
 
    if length(x)~=32
        'error-input length is not 32'
        return
    end
    
%% define W_N

N_16 = 16;

W_16 = exp((-j*2*pi)/N_16);

N_32=32;

W_32 = exp((-j*2*pi)/N_32);
%% separate odds from evens into TWO 16-SAMPLE arrays; Keep in mind matlab has it all backwards
y=zeros(1,16);
z=zeros(1,16);

% essentially picking every other value for each array

for n = 0:15
    y(n+1)=x(2*n+1); % pick up EVEN subscripts
    z(n+1)=x(2*n+2); % pick up ODD subscripts
end


%% separeate further into FOUR 8-SAMPLE arrays; 

yy0 = zeros(1,8);
yy2 = zeros(1,8);

zz1 = zeros(1,8);
zz3 = zeros(1,8);

for n = 0:7
    
    yy0(n+1)=y(2*n+1); % pick up EVEN subscripts
    yy2(n+1)=y(2*n+2); % pick up ODD subscripts
end


for n = 0:7

    zz1(n+1)=z(2*n+1); % pick up EVEN subscripts
    zz3(n+1)=z(2*n+2); % pick up ODD subscripts
end



%% calculaing EVEN-coefficient FFTs

YY0 = fft(yy0); % FFT of the sequence starting with subscript 0
YY2 = fft(yy2); % FFT of the sequence starting with subscript 2

Y = zeros(1,16);


for n=1:8  
 Y(n) = YY0(n)+ W_16^(n-1)*YY2(n);
end 

 
for n = 9:16
    Y(n) = YY0(n-8)- W_16^(n-9)*YY2(n-8);
end


%% calculaing ODD-coefficient FFTs

ZZ1 = fft(zz1); % FFT of the sequence starting with subscript 1
ZZ3 = fft(zz3); % FFT of the sequence starting with subscript 3

Z = zeros(1,16);

for n=1:8
 Z(n) = ZZ1(n)+ W_16^(n-1)*ZZ3(n);
end 

 
for n = 9:16
    Z(n) = ZZ1(n-8)- W_16^(n-9)*ZZ3(n-8);
end


%% put it all together

X=zeros(1,32);

for n=1:16
 X(n) = Y(n)+ W_32^(n-1)*Z(n);
end

for n = 17:32
    X(n) = Y(n-16)- W_32^(n-17)*Z(n-16);
end

%% Normalize the calculated DFT by dividing by N

X=X/length(X);


%% Plot

    
figure()
stem(fftshift(abs(X)),'r');
%legend('My FFT implementation');
hold on
stem(fftshift(abs(fft(x)/length(fft(x)))),'b');
%legend('MATLAB FFT reference');
hold off
legend('My FFT implementation','MATLAB FFT reference');
title("fftshift(abs(X/N)) & fftshift(abs(fft(x)/N))")

figure()
subplot(2,1,1)
stem(fftshift(abs(X)),'r');
legend('My FFT implementation');
subplot(2,1,2)
stem(fftshift(abs(fft(x)/length(fft(x)))),'b');
legend('MATLAB FFT reference');


end
