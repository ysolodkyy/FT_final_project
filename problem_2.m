%% problem 2: Plotting temperature on a disk 
%{
  rim temperature u(theta,1) = cos(theta) +1/2*cos(theta);
%}

%%
clear all
close all
clc



M = 200;
N=200; % the number of samples
K = 60; 

dR=1/M;
dT = 2*pi/N; % this is the delta_t for sampling the time function
R = [0:dR:1-dR]';
T=[0:dT:2*pi-dT]';
n=0:N-1;

u= cos(n*dT)+cos(2*dT*n)/2; 



figure(1)
stem(n,u)
title("sampled function")

%% now get the coefficients via DFT

Coeffs = 1/N*(fft(u));

figure(2)

m = 0:length(Coeffs)-1;
Coeffs= real(Coeffs);
%Coeffs = fftshift(Coeffs);
stem(n,abs(Coeffs))
title("Fourier Coefficients");


%%
R(M+1) = R(M);
T(N+1) = 2*pi; 
[RR,TT] = meshgrid(R,T); % first index is nt
[XX,YY] = pol2cart(TT,RR); 
V=zeros(M+1,M+1);



for nr = 1:M+1
    for nt =1:N+1
        sum = 0; % 0th coefficient
        
        for k = 1:K
          sum = sum + 1/pi*(1-k/K)*Coeffs(k)*R(nr)^k*cos(k*T(nt));
        end
        V(nt,nr) = sum;
    end
end

%%
figure(3) %  density plot
pcolor(XX,YY,V);
shading('interp')
colorbar;
axis equal
title("temperature on the disk");

%figure(4) % is this the density plot? 
%plot(T,V(:,M+1),'r-')
%hold on
%plot(T,V(:,M/2),'b-')
%plot(T,V(:,M/4),'k-')
%hold off
