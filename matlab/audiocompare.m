function [MSE, retained] = audiocompare(file1, file2)
% Get data and sampling rate from sig1 audiofile
sig1 = audioread(file1);
sig1 = sig1(:,1);

% Get data and sampling rate from sig1 audiofile
sig2 = audioread(file2);
sig2 = sig2(:,1);

x_n = sum(abs(sig1));
x_nbar = sum(abs(sig2));

%calculate MP4 .wav file % loss
retained = x_nbar/x_n;

MSE = mse(sig1,sig2);
end