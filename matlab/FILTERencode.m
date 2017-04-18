function out_sig = FILTERencode( filename )

% Get data and sampling rate from in_sig audiofile
[in_sig, Fs] = audioread(filename);
in_sig = in_sig(:,1);

plotspec(in_sig, Fs)

% Compress the in_sig audiofile and get its data and sampling rate
Wn = [100 4000]/(Fs/2);
bpf = fir1(100, Wn, 'bandpass');
filtered = filter(bpf,1,in_sig);

% Create a WAV file from the compressed audio, which will be returned
audiowrite('FILTER_lossy.wav', filtered, Fs);
[out_sig, Fs] = audioread('FILTER_lossy.wav');

plotspec(out_sig, Fs)

end
