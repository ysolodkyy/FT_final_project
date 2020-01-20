close all; 
clear all; 
clc;

x1 = ones(1,32)

for n=1:32
x1(n)=x1(n)+n;
end


x2 = fftshift(x1)


x3 = zeros(1,32);


for n=1:32
x3(n)=(n-15)^3
end

myfft32(x1);

myfft32(x2);

myfft32(x3);