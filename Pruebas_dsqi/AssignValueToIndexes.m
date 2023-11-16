%Assign a value between 0.1-1 to each of the indexes and calculate the
%geometric mean
function [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01, cSQI_01, basSQI_01,dSQI_01,geometricMean] = AssignValueToIndexes(kSQI,sSQI, pSQI, rel_powerLine, cSQI, basSQI,total_dSQI)
   y = [lowerLimit 1]; %vector para interpolation
   y_2 = [0.1 1]; %vector para interpolation
   
   
   %for kSQI
   if(isnan(kSQI)) %occurs when the entire ECG segment has a constant value (typically 0)
      kSQI_01 = lowerLimit;
   else
       x_k = [2.5 5.01];
       if kSQI<=2.5
         kSQI_01 = lowerLimit;
       elseif kSQI>5
          kSQI_01 =1;
       else
          kSQI_01 = interp1(x_k,y,kSQI);
       end
   end

   %for sSQI
   if(isnan(sSQI)) %occurs when the entire ECG segment has a constant value (typically 0)
      sSQI_01 = lowerLimit;
   else
       x_s = [-0.1 2.0];
       if sSQI<-0.1
           sSQI_01 = lowerLimit;
       elseif sSQI>2
           sSQI_01 = 1;
       else
           sSQI_01 = interp1(x_s,y,sSQI);
       end
   end

   %for pSQI
   if(isnan(pSQI)) %occurs when the entire ECG segment has a constant value (typically 0)
      pSQI_01 = lowerLimit;
   else
       x_p1 = [0.075 0.6];
       if pSQI<=0.075 
           pSQI_01 = lowerLimit;
       elseif pSQI>0.6
           pSQI_01 = 1;
       else
           pSQI_01 = interp1(x_p1,y,pSQI);
       end
    end

   % for rel_powerLine SQI_rel_powerLine

   if(isnan(rel_powerLine)) %occurs when the entire ECG segment has a constant value (typically 0)
      SQI_rel_powerLine_01 = lowerLimit;  
   else
       x_rp = [0.05 0.001];
       y_rp =  [0.5, 1];
       x_rp2 = [4, 0.05];
       y_rp2 = [0.1, 0.5];
       if rel_powerLine < 0.001
           SQI_rel_powerLine_01 = 1;
       elseif rel_powerLine < 0.05
           SQI_rel_powerLine_01 = interp1(x_rp,y_rp, rel_powerLine);
       elseif rel_powerLine > 4
           SQI_rel_powerLine_01 = lowerLimit;  
       else
           SQI_rel_powerLine_01 = interp1(x_rp2,y_rp2, rel_powerLine);
       end
   end
   %for cSQI
   x_c = [0.6 0.25];
   if cSQI> 0.6
       cSQI_01 = 0.01;
   elseif cSQI<0.25
       cSQI_01 = 1;
   else
       cSQI_01 = interp1(x_c,y,cSQI);
   end

   %for basSQI
   if(isnan(basSQI)) %occurs when the entire ECG segment has a constant value (typically 0)
       basSQI_01 = 0.01;
   else
       x_b = [0.6 0.95];
       if basSQI<0.6
           basSQI_01 = 0.01;
       elseif basSQI>0.95
           basSQI_01 = 1;
       else
           basSQI_01 = interp1(x_b,y_2,basSQI);
       end
   end

   %for dSQI
   if total_dSQI==0
       dSQI_01=0.1;%lowerLimit; %si es 0 de momento ponemos 0.1
   else
      dSQI_01 = total_dSQI;
   end

   %calculate the geometric mean between the indexes 
   %index_product = kSQI_01*sSQI_01*pSQI_01*SQI_rel_powerLine_01*cSQI_01*basSQI_01*dSQI_01;
   %geometricMean = (index_product)^(1/7);

   % exponet m_order
   m_order=2;
   index_product = kSQI_01*pSQI_01^2*SQI_rel_powerLine_01^2*cSQI_01*basSQI_01^2*dSQI_01;
   geometricMean = (index_product)^(1/(6));
end

function lower_limit = lowerLimit  %usamos de momento 0.1 como valor mínimo para los índices
    lower_limit = 0;
end 