% FIR DESIGN
w1 = 24;
w2 = 36;
fs = 320;
fcuts = [w1-2 w1 w2 w2+2];
%w1 = 2*pi*w1/fs;
%w2 = 2*pi*w2/fs;
fcuts = fcuts.*(2*pi/fs);
j=20001;
l = (j+1)/2;

N = 175;
Nl = (N-1)/2;
beta = 0;
w = kaiser(N,beta);

% filter coefficients are (sin(w2n)-sin(w1n)/pin);
for i = 1:j
    if(i == l)
        coeff(i) = (fcuts(3)-fcuts(2))/pi;
    end
    if (i ~= l)
        coeff(i) = (sin(fcuts(3)*(i-l)) - sin(fcuts(2)*(i-l)))/(pi*(i-l));
    end
    hh(i) = 0;
    if (i+Nl>l)
        if(i-Nl<l)
            hh(i) = coeff(i)*w(i-l+Nl);
        end
    end
end
%plot(coeff)
f = 0:4000;
f = f./100;
ff = f.*(2*pi/fs);

mags = [0 1 0];
devs = [0.5 0.07 0.5];
fsamp = 2*pi;

%[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
%n = n + rem(n,2);
%hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');


% N = 71;
% m = (N+1)/2;
% kaiser_arr = kaiser(N,5000);
% new_coeff = 1:j;
% new_coeff = new_coeff.*0;
% for i = 1:N
%     new_coeff(l-m+i) = coeff(l-m+i);%*kaiser_arr(i);
% end
k = freqz(hh,1,ff,2*pi);
k_orig = freqz(coeff,1,ff,2*pi);
% %figure();
plot(f ,abs(k./max(abs(k))),f,abs(k_orig))
% abs(k(2500))