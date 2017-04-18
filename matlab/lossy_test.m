clear;

file = 'bass.wav';

ACCout = ACCencode(file);
[MSE_ACC, retained_ACC] = audiocompare(file, 'ACC_lossy.wav');

OGGout = OGGencode(file);
[MSE_OGG, retained_OGG] = audiocompare(file, 'OGG_lossy.wav');

FILTERout = FILTERencode(file);
[MSE_FILTER, retained_FILTER] = audiocompare(file, 'FILTER_lossy.wav');