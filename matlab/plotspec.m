function plotspec(sig, Fs)

N = length(sig);
S = abs(fft(sig));
bin_vals = [0:N-1];
fax_Hz = bin_vals*Fs/N;
N2 = ceil(N/2);

figure;
plot(fax_Hz(1:N2), S(1:N2));

end
