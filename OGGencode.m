function compressed = OGGencode( filename )
[raw, Fs] = audioread(filename);
raw = raw(:,1);

audiowrite('HH_10.ogg', raw, Fs)
[ogg, Fs] = audioread('HH_10.ogg');

audiowrite('OGG_lossy.wav', ogg, Fs);
[compressed, Fs] = audioread('OGG_lossy.wav');

delete('HH_10.ogg')
end

