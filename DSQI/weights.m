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


function w=weights(x_center,y_center,length_template)
[sOrt,u]=sort(x_center); %%p %%Q %%T
w=zeros(30,length_template);
for i=1:3
    clear('W')
mu = [ sOrt(i)    y_center(u(i)) ];
if i==1
Sigma = [3*length_template 0; 0 20];
end
if i==2
 Sigma = [length_template  0; 0 80];
end
if i==3
    Sigma = [4*length_template 0; 0 20];
end
x1 = 1:length_template; x2 =1:30;
[X1,X2] = meshgrid(x1,x2);
W = mvnpdf([X1(:) X2(:)],mu,Sigma);
W = reshape(W,length(x2),length(x1));
if i==2
W =W/(max(max(W)));
else
    W=W/2/max(max(W));
end

w=w+W;

end
w=w/max(max(w));
end