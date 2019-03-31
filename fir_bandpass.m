clc
clear
% FIR Filter Design Band-Pass
freq = [23 24 36 37];
samp_freq = 320;
freq_d = freq.*(2*pi/samp_freq);
w1 = freq_d(2);
w2 = freq_d(3);

%2*n+1 coefficients
n = 70
b = 0.0

%Lower bound on n
A=-20*log10(0.15);
wt=2*pi*2/samp_freq;
N_lower_bound=(A-7.95)/(2.284*wt);
n_min = ceil(N_lower_bound/2)

%ideal_coef
for i=1:2*n+1
    if(i ~= (n+1))  
        ideal(i) = (sin(w2*(i-n-1))-sin(w1*(i-n-1)))/(pi*(i-n-1));
    else
        ideal(i) = (w2-w1)/(pi);
    end
end

kaiser_window = kaiser(2*n+1,b);

final_coeff = kaiser_window'.*ideal;

w = linspace(freq_d(1)-0.1,freq_d(4)+0.1,100);
k = freqz(final_coeff,1,w);
max = max(abs(k));
plot(w,abs(k)./max);
freq_need = [23 25 35 37].*(2*pi/samp_freq);
k = freqz(final_coeff./max,1,freq_need);
abs(k)
    
    