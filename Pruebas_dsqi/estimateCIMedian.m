function [CI] = estimateCIMedian(index_vector1,index_vector2, alph,iter)

    U_vector = zeros(0,iter-1);
    for i=1:iter
        index_vector1_b = bootstrp(1,@(x) x,index_vector1);
        index_vector2_b = bootstrp(1,@(x) x, index_vector2);

        U_vector(i) = median (index_vector1_b)-median(index_vector2_b);
    end
    U_vector = sort(U_vector);
    low_limit= U_vector(iter*alph/2);
    upp_limit= U_vector(iter-iter*alph/2);
    CI=[low_limit, upp_limit];
end

