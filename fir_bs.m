fcuts = [15.5 17.5 23.5 25.5];
mags = [1 0 1];
devs = [0.5 0.09 0.5];
fsamp = 250;

[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

f = 0:4000;
f = f./100;
ff = f.*(2*pi/fsamp);

k = freqz(hh,1,ff,2*pi);
plot(f ,abs(k./max(abs(k))))