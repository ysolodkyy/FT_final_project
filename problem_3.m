%% Final Problem 3

%{
let x(t) = sinc^2(pi*t)
then by Lecture 1 triangular pulse example and the symmetry property H(t) <=> h(-f), X(f) = 1-abs(f), abs(f)<1; and 0 elsewhere. Therefore, the Nyquist frequency fc=1. 
%}
%%
clear all; 
close all;
syms t

x = (sin(pi*t)/(pi*t))^2

figure()
ezplot(x, [-2 2 -.5 1])
legend('x(t)')



N=12;
 

%% part(a) 

F=3;
sum_pos=0;

for k =1:N
sum_pos = sum_pos+subs(x,t,k/F)*sinc(F*(t-k/F));
end

DC=limit(x,t,0)*sinc(F*t); % verify sinc(0) = 1; k =0 value; 

sum_neg = 0;

for k=1:N
    
   sum_neg = sum_neg+subs(x,t,-k/F)*sinc(F*(t+k/F));
end

y_a=sum_neg+DC+sum_pos; 

%% part(b) 

F=2;
sum_pos=0;

for k =1:N
sum_pos = sum_pos+subs(x,t,k/F)*sinc(F*(t-k/F));
end

DC=limit(x,t,0)*sinc(F*t); % verify sinc(0) = 1; k =0 value; 

sum_neg = 0;

for k=1:N
    
   sum_neg = sum_neg+subs(x,t,-k/F)*sinc(F*(t+k/F));
end

y_b=sum_neg+DC+sum_pos; 

%% part(c) 

F=1;
sum_pos=0;

for k =1:N
sum_pos = sum_pos+subs(x,t,k/F)*sinc(F*(t-k/F));
end

DC=limit(x,t,0)*sinc(F*t); % verify sinc(0) = 1; k =0 value; 

sum_neg = 0;

for k=1:N
    
   sum_neg = sum_neg+subs(x,t,-k/F)*sinc(F*(t+k/F));
end

y_c=sum_neg+DC+sum_pos; 

%% plot part(a)
figure()
ezplot(x, [-2 2 -.5 1])
legend("x(t)")
hold on 
ezplot(y_a, [-2 2 -.5 1])
legend("y_a(t)")
title("x(t) and y_a(t)")
hold off
legend('x(t)', 'y_a(t)')

figure()
ezplot(x-y_a, [-2 2 -.5 1])
title("x(t)-y_a(t)")

%% plot part (b)
figure()
ezplot(x, [-2 2 -.5 1])
hold on 
ezplot(y_b, [-2 2 -.5 1])
title("x(t) and y_b(t)")
hold off
legend('x(t)', 'y_b(t)')

figure()
ezplot(x-y_b, [-2 2 -.5 1])
title("x(t)-y_b(t)")

%% plot part(c) 

figure()
ezplot(x, [-2 2 -.5 1])
hold on 
ezplot(y_c, [-2 2 -.5 1])
title("x(t) and y_c(t)")
hold off
legend('x(t)', 'y_c(t)')

%{

For F values F=2 & F=3, y(y) is indistinguishable from x(n); 

%}


figure()
ezplot(x-y_c, [-2 2 -.5 1])
title("x(t)-y_c(t)")
