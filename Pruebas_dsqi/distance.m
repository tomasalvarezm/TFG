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



function out=distance (A,B,W);

w=W./(sum(sum(W)));
x_bar=A.*w;
y_bar=B.*w;
Num=sum(sum((A-x_bar).*(B-y_bar).*w));
denum=sum(sum(w.*(A-x_bar).^2))*sum(sum(w.*(B-y_bar).^2));
out=Num/sqrt(denum);

