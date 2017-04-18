function out_sig = OGGencode( filename )

% Get data and sampling rate from in_sig audiofile
[in_sig, Fs] = audioread(filename);
in_sig = in_sig(:,1);

plotspec(in_sig, Fs)

% Compress the in_sig audiofile and get its data and sampling rate
audiowrite('temp.ogg', in_sig, Fs)
[ogg, Fs] = audioread('temp.ogg');

% Create a WAV file from the compressed audio, which will be returned
audiowrite('OGG_lossy.wav', ogg, Fs);
[out_sig, Fs] = audioread('OGG_lossy.wav');

plotspec(out_sig, Fs)

% Delete Temporary File
delete('temp.ogg')

end
