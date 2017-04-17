function compressed = FILTERencode( filename )

% Get data and sampling rate from raw audiofile
[raw, Fs] = audioread(filename);
raw = raw(:,1);

% Compress the raw audiofile and get its data and sampling rate
order    = 10;
fcutlow  = 100;
fcuthigh = 4000;
[b,a]    = butter(order,[fcutlow,fcuthigh]/(Fs/2), 'bandpass');
filtered = filter(b,a,raw);

% Create a WAV file from the compressed audio, which will be returned
audiowrite('FILTER_lossy.wav', filtered, Fs);
[compressed, Fs] = audioread('FILTER_lossy.wav');

% Delete Temporary File
delete('temp.ogg')

end