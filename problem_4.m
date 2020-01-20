%% Final Problem 4

%% multiply a and b. 

a = 9*ones(1,10000);

b = 6*ones(1,10000);

% zero pad
b_dummy=[b zeros(1,length(b))];
a_dummy=[a zeros(1,length(a))];


c = ifft(fft(a_dummy).*fft(b_dummy)); % calculate the convolution


%% carry over calculations
d_length=length(a)+length(b);
d = zeros(1,d_length);
carry = 0;
Base = 10;

for n = 1:length(d) %length(a)+length(b)
    
d(n) = rem(c(n)+carry,Base);
carry = floor((c(n)+carry)/Base);

end

%% output

LittleEndian_output=int16(d) % little endian

% big endian
BigEndian_output=fliplr(LittleEndian_output)
