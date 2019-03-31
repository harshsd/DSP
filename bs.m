a = [15.5 17.5 23.5 25.5];
b = a*2*pi/250;
c = tan(b./2);
B = c(4)-c(1);
w0 = c(4)*c(1);
s = (B.*c)./(c.*c - w0);
d1 = 0.15;
d2 = 0.15;
D1 = (1/((1-d1)^2))-1;
D2 = (1/(d2^2))-1;
N = log(sqrt(D2/D1))/log(1.5128);
e = sqrt(D1);
syms x
C4 = 8*x^4 - 8*x^2 +1;
f = C4*C4*e*e;
f+1;
[num,den]=numden(f+1);
%t = 1/(1+f);
%[n,d] = numden(t)
