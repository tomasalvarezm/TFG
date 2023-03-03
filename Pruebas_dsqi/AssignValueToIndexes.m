%assign a value between 0.1-1 to each of the indexes and calculate the
%geometric mean
function [kSQI_01,sSQI_01, pSQI_01, cSQI_01, basSQI_01,dSQI_01,geometricMean] = AssignValueToIndexes(kSQI,sSQI, pSQI, cSQI, basSQI,total_dSQI)
   y = [lowerLimit 1]; %vector para interpolation
   %for kSQI
   x_k = [2.5 5.01];
   if kSQI<=2.5
     kSQI_01 = lowerLimit;
   elseif kSQI>5
      kSQI_01 =1;
   else
      kSQI_01 = interp1(x_k,y,kSQI);
   end

   %for sSQI
   x_s = [0.499 2.01];
   if sSQI<0.5
       sSQI_01 = lowerLimit;
   elseif sSQI>2
       sSQI_01 = 1;
   else
       sSQI_01 = interp1(x_s,y,sSQI);
   end

   %for pSQI
   x_p1 = [0.9 0.799];
   x_p2 = [0.299 0.5];
   if pSQI>=0.9 
       pSQI_01 = lowerLimit;
   elseif pSQI<0.3
       pSQI_01 = lowerLimit;
   elseif pSQI>= 0.5 && pSQI< 0.8
       pSQI_01 = 1;
   elseif pSQI>= 0.8 && pSQI<0.9
       pSQI_01 = interp1(x_p1,y,pSQI);
   else
       pSQI_01 = interp1(x_p2,y,pSQI);
   end

   %for cSQI
   x_c = [0.66 0.44];
   if cSQI> 0.65
       cSQI_01 = lowerLimit;
   elseif cSQI<0.45
       cSQI_01 = 1;
   else
       cSQI_01 = interp1(x_c,y,cSQI);
   end

   %for basSQI
   x_b = [0.84 0.96];
   if basSQI<0.85
       basSQI_01 = lowerLimit;
   elseif basSQI>0.95
       basSQI_01 = 1;
   else
       basSQI_01 = interp1(x_b,y,basSQI);
   end

   %for dSQI
   if total_dSQI==0
       dSQI_01=lowerLimit; %si es 0 de momento ponemos 0.1
   else
      dSQI_01 = total_dSQI;
   end

   %calculate the geometric mean between the indexes 
   index_product = kSQI_01*sSQI_01*pSQI_01*cSQI_01*basSQI_01*dSQI_01;
   geometricMean = (index_product)^(1/6);
end

function lower_limit = lowerLimit  %usamos de momento 0.1 como valor mínimo para los índices
    lower_limit = 0.1;
end 