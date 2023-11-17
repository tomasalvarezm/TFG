%Calculates a confidence interval for the difference in the mean value 
% of two sets of mSQI indices obtained on two different signal fragments.
%
%It receives as arguments the two arrays of mSQI indices to compare
%(index_vector1, index_vector2), and the level of significance in the
%calculation of the confidence interval (alph), and
%the number of iterations to use in Bootstrap to calculate the confidence interval (iter). 
% Returns the calculated confidence interval.

function [CI] = estimateCIMean(index_vector1, index_vector2, alph, iter)

    U_vector = zeros(0,iter-1);
    for i=1:iter
        index_vector1_b = bootstrp(1, @(x) x, index_vector1);
        index_vector2_b = bootstrp(1, @(x) x, index_vector2);
        
        U_vector(i) = mean (index_vector1_b)-mean(index_vector2_b);
    end
    U_vector = sort(U_vector);
    low_limit= U_vector(iter*alph/2);
    upp_limit= U_vector(iter-iter*alph/2);
    CI=[low_limit, upp_limit];
end

