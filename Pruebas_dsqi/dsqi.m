%%dsqi 
%Dynamic signal Quality index for ECGs based on smoothed pseudo Wigner
%Ville transform of a short window of signal
   % inputs:
   %---------------------
   % ECG               :the column vector of signal , 
   % fs                : the sampling frequency in Hz
   % outputs: 
   %---------------------
   % total_score       : the score for the whole recording
   % cont_score        : continuous quality score ( The score for the three
   %                     first beats in NaN )
   %----------------------
   % 

% Copyright (C) 2018  Negin Yaghmaie
% Monash university, Biomdical Signal Processing Lab, and
% Sharif University of Technology
% negin.ye@yahoo.com
%
% Last updated : 06-09-2018
%
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the
% Free Software Foundation; either version 2 of the License, or (at your
% option) any later version.
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
% Public License for more details.



% If you are using this code please cite:
%    N. Yaghmaie, M. A. Maddah-Ali, H. F. Jelinek, and F. Marzbanrad, "Dynamic signal quality
%    index for electrocardiograms," Physiological Measurement, 2018. doi: 10.1088/1361-6579/aadf02


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [total_score,cont_score,sub_ind]=dsqi(ECG,fs) 
     sub_ind=zeros(1,100);
     clear('marker');
     clear('template')
     if size(ECG,1)<size(ECG,2)
         ECG=ECG';
     end
     signow=ECG';   
     flat=0;
     
    
 %%%%%%% QRS finding
[qrs_i_raw,varargout] = pantompkins_qrs(signow,fs,logical(0));
 
  t=qrs_i_raw; %% t contains peaks
  beat_locations=qrs_i_raw(4:end);
  
  %%%%%%%% finding flat line
  % rescaling
  if length(t)>4
      rp=median(signow(t));
      signow=1000*signow/rp;
  end
      for l=1:floor(length(signow)/5):floor(4*length(signow)/5)-1 %%signal devided to 5 parts, to check if each part is flat
          test=signow(l:l+floor(length(signow)/5));
% %          
% %         
            Std=std(diff(test));
% %          
% %          
           if (Std<1)
               flat=flat+1;
           end
%         
      end
%
  s=signow';
  
  % dqsi calculation
   if ((length(t)<4 )||flat) %%if no peak is found or flat line is detected
         total_score=0;
         beat_by_beat_score=0;
         cont_score=0;
   else
  temp_length=ceil(mean(diff(t))); %%template length is set to the average beat duration
  s=padarray(s,[temp_length,0],'both');
  t=t+temp_length;
 
 template=zeros(30,temp_length);
 previous=zeros(30,temp_length);
  b=floor((temp_length)/2);
  c=temp_length-b-1;  %%%% definig Weigths
           mid1=ceil(temp_length/4);
           mid2=ceil(3*temp_length/4);
         W=weights([mid1, b ,mid2],[4  6  4],temp_length);

sub_ind=zeros(length(t)-3,4);
for i=1:length(t)-3  %%moving window by window by 4 beats
    clear('TFR');clear('f_new');
     
     start=t(i)-b-1;
     stop=t(i+3)+c+1;
     previous=template;
    %%3 beats in between
    f_new=(s(start:stop)); %% a window of 3 beats
    [TFR,T,F]=tfrspwv(hilbert(f_new),1:1:length(f_new),128);
    % tfrqview(TFR,hilbert(f_new),T,'TYPE2'); %---->comment this line if you dont want to see the graphs
    
    %%%%%next beat
        window=(t(i+3)-b:t(i+3)+c)-start+1;
        next_beat=TFR(1:30,window);
        new=next_beat;
        clear('window');

     for j=i:i+2 %%building the new template based on three previous beats
            
        window=(t(j)-b:t(j)+c)-start+1;
        template=TFR(1:30,window)+template;
        clear('window')
     end
    template=template/3; %% template is the average of the 3 previous beats
 
     for j=i:i+2 %%calculating the index for the three beats building the template
        window=(t(j)-b:t(j)+c)-start+1;
        sub_ind(i,j-i+1)=distance(TFR(1:30,window),template,W)*Snr(template,W)*Snr(TFR(1:30,window),W);
     end 
     %%% distance of new beat with template
     sub_ind(i,4)=distance(new,template,W)*Snr(template,W)*Snr(new,W);
     
     if(sub_ind(i,4)<0.6)
           flag1=1;
     end
    
     
         

end
hm3=ceil(sub_ind-0.60);
idx3=[0 sum(hm3')>2 0];
 ii3=strfind(idx3,[0 1]);
 jj3=strfind(idx3,[1 0])-1;
 number3=jj3-ii3+1;
 no_of_cons3=sum(number3(find(number3>2))); %%if more than 3 beats are bad, it will affect the index, if not, the quality is still okay
 total_score=no_of_cons3/(size(sub_ind,1));
 beat_by_beat_score=sub_ind(:,4);
cont_score=interp1(beat_locations,beat_by_beat_score,1:length(ECG));
 
   end
       
end



