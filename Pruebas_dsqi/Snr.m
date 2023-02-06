function x=Snr(sig,hard) %% calculates the relative energy of areas of interest in a window of one beat
   
   h=ceil(hard-0.3);
   want=h.*sig;
   x=sqrt(sum(sum(want.^2))/sum(sum(sig.^2)));

end
