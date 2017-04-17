clear

[raw, FsWAV] = audioread('HH_10.wav');
rawL = raw(:,1);

audiowrite('HH_10.ogg', raw, FsWAV)

[ogg, FsOGG] = audioread('HH_10.ogg');

audiowrite('HH_10_lossy.wav', ogg, FsOGG);
[oggW, FsOGGW] = audioread('HH_10_lossy.wav');

oggWL = oggW(:,1);

MSE = (rawL-oggWL).^2;

% Here is where we do the loss calculation:
orig = sum(abs(rawL));
new = sum(abs(oggWL));
loss = 1 - sum(abs(oggWL))/sum(abs(rawL));
% ^That was where we did the loss calculation.

disp(['MSE: ' num2str(sum(MSE))]);
disp(['Loss (%): ' num2str(loss)]);