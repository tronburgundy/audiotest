function compressed = OGGencode( filename )

% Get data and sampling rate from raw audiofile
[raw, Fs] = audioread(filename);
raw = raw(:,1);

% Compress the raw audiofile and get its data and sampling rate
audiowrite('temp.ogg', raw, Fs)
[ogg, Fs] = audioread('temp.ogg');

% Create a WAV file from the compressed audio, which will be returned
audiowrite('OGG_lossy.wav', ogg, Fs);
[compressed, Fs] = audioread('OGG_lossy.wav');

% Delete Temporary File
delete('temp.ogg')

end
