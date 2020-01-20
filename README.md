# FT_project1
Fourier Transform: Periodization of X(f) with Period F. Partial and Cesaro Sums of Fourier Series.

Problem 1:
Implementing the FFT radix 2 algorithm using built in matlab fft()
function.
myfft32.m is the implementation of the problem. It is meant to be
called out with a 32-sample input function x, as in myfft32(x). The
result will display in the command window, and plotted in two separate
figures for comparison with the actual matlab fft() command.
problem1_test.m will run the function for three inputs.

Problem 2:
The Fourier series coefficients of a periodic, band limited signal x
are given by the DFT of one period of samples x, divided by N, where N
is the number of samples of x, and the DFT length.

Problem 3:
(i)
Let x(t) = sinc^2(pi*t); then by Lecture 1 triangular pulse example
and the symmetry property H(t) <=> h(-f), X(f) = 1-abs(f), abs(f)<1;
and 0 elsewhere. Therefore, the Nyquist frequency fc=1.
(ii)
For F values F=2 & F=3, y(y) is indistinguishable from x(n);

Problem 4:
Calculates the product of two arrays, a and b;
a: array of 10,000 9's;
b: array of 10,000 6's;
The output is also an array, presented as big endian, and little
endian.
