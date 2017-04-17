raw = 'HH_10.wav';

compressed = ACCencode(raw);
statACC = compare(raw, compressed);

compressed = OGGencode(raw);
statOGG = compare(raw, compressed);

compressed = FILTERencode(raw);
statFILTER = compare(raw, compressed);