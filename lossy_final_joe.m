%LOSSY TEST


% Get data and sampling rate from raw audiofile
[raw, Fs] = audioread('HH_10.wav');
raw = raw(:,1);

%OGG----------------------------------------------------------------------
% Compress the raw audiofile and get its data and sampling rate
audiowrite('temp.ogg', raw, Fs)
[ogg, Fs] = audioread('temp.ogg');

% Create a WAV file from the compressed audio, which will be returned
audiowrite('OGG_lossy.wav', ogg, Fs);
[compressedOGG, Fs] = audioread('OGG_lossy.wav');

% Delete Temporary File
delete('temp.ogg')

%ACC----------------------------------------------------------------------
% Get data and sampling rate from raw audiofile

% Compress the raw audiofile and get its data and sampling rate
audiowrite('temp.mp4', raw, Fs)
[ogg2, Fs] = audioread('temp.mp4');

% Create a WAV file from the compressed audio, which will be returned
audiowrite('ACC_lossy.wav', ogg2, Fs);
[compressedACC, Fs] = audioread('ACC_lossy.wav');

% Delete Temporary File
delete('temp.mp4')

%FILTER-------------------------------------------------------------------

%todo

%COMPARE------------------------------------------------------------------

%OGG
%sum both the original .wav and the new .wav
orig1 = sum(abs(raw));
new1 = sum(abs(compressedOGG));
%calculate OGG .wav file % loss
OGGloss = (1 - sum(abs(new1))/sum(abs(orig1)))*100;
disp(OGGloss);

%ACC
%sum both the original .wav and the new .wav
orig2 = sum(abs(raw));
new2 = sum(abs(compressedACC));
%calculate MP4 .wav file % loss
MP4loss = (1 - sum(abs(new2))/sum(abs(orig2)))*100;
disp(MP4loss);
MSE= 1./(size(raw))*(sum(compressedOGG-raw).^2);
disp(MSE);

%FILTER

%todo

%plot

N = length(raw);
S = abs(fft(raw));
bin_vals = [0:N-1];
fax_Hz = bin_vals*Fs/N;
N2 = ceil(N/2);
figure;
plot(fax_Hz(1:N2), S(1:N2));
hold on
N1 = length(compressedACC);
S1 = abs(fft(compressedACC));
bin_vals1 = [0:N1-1];
fax_Hz1 = bin_vals1*Fs/N1;
N21 = ceil(N1/2);
plot(fax_Hz1(1:N21), S1(1:N21));
