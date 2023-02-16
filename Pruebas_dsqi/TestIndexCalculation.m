
% [kSQI,sSQI, pSQI, cSQI] = IndexForWindows("ECGNormal.txt");

%disp("ECGRuido.txt");
hold on
[kSQI,sSQI, pSQI, cSQI] = SignalIndexes("ECGNormal.txt");
%yline(kSQI);



