function out_sig = ACCencode( filename )

% Get data and sampling rate from in_sig audiofile
[in_sig, Fs] = audioread(filename);
in_sig = in_sig(:,1);

figure;
plotspec(in_sig, Fs)
hold on;

% Compress the raw audiofile and get its data and sampling rate
audiowrite('temp.mp4', in_sig, Fs)
[acc, Fs] = audioread('temp.mp4');

% Create a WAV file from the compressed audio, which will be returned
audiowrite('ACC_lossy.wav', acc, Fs);
[out_sig, Fs] = audioread('ACC_lossy.wav');

plotspec(out_sig, Fs)
hold off

% Delete Temporary File
delete('temp.mp4')

end

