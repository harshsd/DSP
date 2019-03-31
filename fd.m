a = [23 25 35 37];
b = a*2*pi/320;
c = tan(b./2);
B = c(3)-c(2);
w0 = c(3)*c(2);
s = (c.*c - w0)./(B.*c);
d1 = 0.15;
d2 = 0.15;
D1 = (1/((1-d1)^2))-1;
D2 = (1/(d2^2))-1;
N = acosh(sqrt(D2/D1))/acosh(s(4)/s(3));
e = sqrt(D1);
syms x
C4 = 8*x^4 - 8*x^2 +1;
f = C4*C4*e*e;
f+1;
%[num,den]=numden(f+1);
t = 1/(1+f);
[n,d] = numden(t)
d = sym2poly(d)
n = sym2poly(n)
freqs(n,d)
