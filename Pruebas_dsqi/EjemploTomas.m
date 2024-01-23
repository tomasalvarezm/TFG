TEST = 0;

if (TEST)
    time_vector = 1:((7*60 + 59)*60); 
    
    files_Shirt_L = {'L_Day1_2024_1_8.txt', 
        'L_Day2_2024_1_12.txt',
        'L_Day3_2024_1_16.txt',
        'L_Day4_2024_1_20.txt'};

    files_Shirt_M = {'M_Day1_2023_12_28.txt', 
        'M_Day2_2024_1_10.txt',
        'M_Day3_2024_1_15.txt',
        'M_Day4_2024_1_18.txt'};

    files_Shirt_S = {'S_Day1_2023_12_26.txt', 
        'S_Day2_2024_1_9.txt',
        'S_Day3_2024_1_14.txt',
        'S_Day4_2024_1_17.txt'}; 
else
     time_vector = 1:(((7*60 + 59)*60)*1000-360000); 
     
     files_Shirt_L = {'L_Day1_2024_1_8.txt', 
        'L_Day2_2024_1_12.txt',
        'L_Day3_2024_1_16.txt',
        'L_Day4_2024_1_20.txt'};

    files_Shirt_M = {'M_Day1_2023_12_28.txt', 
        'M_Day2_2024_1_10.txt',
        'M_Day3_2024_1_15.txt',
        'M_Day4_2024_1_18.txt'};

    files_Shirt_S = {'S_Day1_2023_12_26.txt', 
        'S_Day2_2024_1_9.txt',
        'S_Day3_2024_1_14.txt',
        'S_Day4_2024_1_17.txt'}; 
 end



fileSets = {files_Shirt_L, files_Shirt_M, files_Shirt_S};
indexes = cell(1, length(fileSets)); % indexes = cell(1, length(fileSets)); -> vector de 3 pos

for setIndex = 1: length(indexes)
    currentFiles = fileSets{setIndex};% ej: currentFiles= fileSets{1} -> files_Shirt_L ->(...,...,....,....)
    indexes{setIndex} = cell(1, length(currentFiles)); % indexes{1}= a un vector con 4 pos 

    for fileIndex = 1:length(currentFiles) % fileIndex = 1:length(currentFiles)=4
        data = ImportPluxData(currentFiles{fileIndex}, 3);
        ecg = data(time_vector);
        [kSQI_01_vector, sSQI_01_vector, pSQI_01_vector, rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector, dSQI_01_vector, geometricMean_vector, averageGeometricMean] = mSQI(ecg, 1000);
        indexes{setIndex}{fileIndex} = geometricMean_vector;
        fprintf("Average mean of windows of %s: %f\n", currentFiles{fileIndex}, averageGeometricMean);
    end
end

indexes_shirt_L = indexes{1};
indexes_shirt_M = indexes{2};
indexes_shirt_S = indexes{3};



%significance level for calculating the confidence intervals
alph = 0.01;
%number of iterations to use in boostrap
iter = 1000;

% Data for the Comparison Within Each Register
% data of Shirt L that will be used for the CI
data_shirt_L_R2R3R4 =[indexes_shirt_L{2},indexes_shirt_L{3},indexes_shirt_L{4}]; % data_shirt_L_R2R3R4 -> R2:register2, R3:register3, R4:register of  of Shirt L
data_shirt_L_R1R3R4 =[indexes_shirt_L{1},indexes_shirt_L{3},indexes_shirt_L{4}];
data_shirt_L_R1R2R4 =[indexes_shirt_L{1},indexes_shirt_L{2},indexes_shirt_L{4}];
data_shirt_L_R1R2R3 =[indexes_shirt_L{1},indexes_shirt_L{2},indexes_shirt_L{3}];

% data of Shirt M that will be used for the CI
data_shirt_M_R2R3R4 =[indexes_shirt_M{2},indexes_shirt_M{3},indexes_shirt_M{4}]; % data_shirt_M_R2R3R4 -> R2:register2, R3:register3, R4:register of Shirt M
data_shirt_M_R1R3R4 =[indexes_shirt_M{1},indexes_shirt_M{3},indexes_shirt_M{4}];
data_shirt_M_R1R2R4 =[indexes_shirt_M{1},indexes_shirt_M{2},indexes_shirt_M{4}];
data_shirt_M_R1R2R3 =[indexes_shirt_M{1},indexes_shirt_M{2},indexes_shirt_M{3}];

% data of Shirt S that will be used for the CI
data_shirt_S_R2R3R4 =[indexes_shirt_S{2},indexes_shirt_S{3},indexes_shirt_S{4}]; % data_shirt_M_R2R3R4 -> R2:register2, R3:register3, R4:register of Shirt M
data_shirt_S_R1R3R4 =[indexes_shirt_S{1},indexes_shirt_S{3},indexes_shirt_S{4}];
data_shirt_S_R1R2R4 =[indexes_shirt_S{1},indexes_shirt_S{2},indexes_shirt_S{4}];
data_shirt_S_R1R2R3 =[indexes_shirt_S{1},indexes_shirt_S{2},indexes_shirt_S{3}];


% Data for the Comparison Across Registers
data_shirtL_vs_shritM_shirtS=cell2mat([indexes_shirt_M,indexes_shirt_S]); % cell2mat-> convert the contents of a cell array into a single matrix
data_shirtM_vs_shritL_shirtS=cell2mat([indexes_shirt_L,indexes_shirt_S]);
data_shirtS_vs_shritL_shirtM=cell2mat([indexes_shirt_L,indexes_shirt_M]);


%CONFIDENCE INTERVALS (CI)
% Comparison Within Each Register of Shirt L Data
%CI for R1 vs {R2, R3 y R4}
CIMedian_shirtL_R1vsR2R3R4 = estimateCIMedian(indexes_shirt_L{1},data_shirt_L_R2R3R4,alph,iter);
CIMean_shirtL_R1vsR2R3R4 = estimateCIMean(indexes_shirt_L{1},data_shirt_L_R2R3R4,alph,iter);
%CI for R2 vs {R1, R3 y R4}
CIMedian_shirtL_R2vsR1R3R4 = estimateCIMedian(indexes_shirt_L{2},data_shirt_L_R1R3R4,alph,iter);
CIMean_shirtL_R2vsR1R3R4 = estimateCIMean(indexes_shirt_L{2},data_shirt_L_R1R3R4,alph,iter);
%CI for R3 vs {R1, R2 y R4}
CIMedian_shirtL_R3vsR1R2R4 = estimateCIMedian(indexes_shirt_L{3},data_shirt_L_R1R2R4,alph,iter);
CIMean_shirtL_R3vsR1R2R4 = estimateCIMean(indexes_shirt_L{3},data_shirt_L_R1R2R4,alph,iter);
%CI for R4 vs {R1, R2 y R3}
CIMedian_shirtL_R4vsR1R2R3 = estimateCIMedian(indexes_shirt_L{4},data_shirt_L_R1R2R3,alph,iter);
CIMean_shirtL_R4vsR1R2R3 = estimateCIMean(indexes_shirt_L{4},data_shirt_L_R1R2R3,alph,iter);

% Comparison Within Each Register of Shirt M Data
%CI for R1 vs {R2, R3 y R4}
CIMedian_shirtM_R1vsR2R3R4 = estimateCIMedian(indexes_shirt_M{1},data_shirt_M_R2R3R4,alph,iter);
CIMean_shirtM_R1vsR2R3R4 = estimateCIMean(indexes_shirt_M{1},data_shirt_M_R2R3R4,alph,iter);
%CI for R2 vs {R1, R3 y R4}
CIMedian_shirtM_R2vsR1R3R4 = estimateCIMedian(indexes_shirt_M{2},data_shirt_M_R1R3R4,alph,iter);
CIMean_shirtM_R2vsR1R3R4 = estimateCIMean(indexes_shirt_M{2},data_shirt_M_R1R3R4,alph,iter);
%CI for R3 vs {R1, R2 y R4}
CIMedian_shirtM_R3vsR1R2R4 = estimateCIMedian(indexes_shirt_M{3},data_shirt_M_R1R2R4,alph,iter);
CIMean_shirtM_R3vsR1R2R4 = estimateCIMean(indexes_shirt_M{3},data_shirt_M_R1R2R4,alph,iter);
%CI for R4 vs {R1, R2 y R3}
CIMedian_shirtM_R4vsR1R2R3 = estimateCIMedian(indexes_shirt_M{4},data_shirt_M_R1R2R3,alph,iter);
CIMean_shirtM_R4vsR1R2R3 = estimateCIMean(indexes_shirt_M{4},data_shirt_M_R1R2R3,alph,iter);

% Comparison Within Each Register of Shirt S Data
%CI for R1 vs {R2, R3 y R4}
CIMedian_shirtS_R1vsR2R3R4 = estimateCIMedian(indexes_shirt_S{1},data_shirt_S_R2R3R4,alph,iter);
CIMean_shirtS_R1vsR2R3R4 = estimateCIMean(indexes_shirt_S{1},data_shirt_S_R2R3R4,alph,iter);
%CI for R2 vs {R1, R3 y R4}
CIMedian_shirtS_R2vsR1R3R4 = estimateCIMedian(indexes_shirt_S{2},data_shirt_S_R1R3R4,alph,iter);
CIMean_shirtS_R2vsR1R3R4 = estimateCIMean(indexes_shirt_S{2},data_shirt_S_R1R3R4,alph,iter);
%CI for R3 vs {R1, R2 y R4}
CIMedian_shirtS_R3vsR1R2R4 = estimateCIMedian(indexes_shirt_S{3},data_shirt_S_R1R2R4,alph,iter);
CIMean_shirtS_R3vsR1R2R4 = estimateCIMean(indexes_shirt_S{3},data_shirt_S_R1R2R4,alph,iter);
%CI for R4 vs {R1, R2 y R3}
CIMedian_shirtS_R4vsR1R2R3 = estimateCIMedian(indexes_shirt_S{4},data_shirt_S_R1R2R3,alph,iter);
CIMean_shirtS_R4vsR1R2R3 = estimateCIMean(indexes_shirt_S{4},data_shirt_S_R1R2R3,alph,iter);


% Histograms for each register of Shirt L
for i = 1:4
    figure;
    histogram(indexes_shirt_L{i}, 20);
    title(['Histogram for indexes\_shirtL{' num2str(i) '}']);
end

% Histograms for each register of Shirt M
for i = 1:4
    figure;
    histogram(indexes_shirt_M{i}, 20);
    title(['Histogram for indexes\_shirtM{' num2str(i) '}']);
end

% Histograms for each register of Shirt S
for i = 1:4
    figure;
    histogram(indexes_shirt_S{i}, 20);
    title(['Histogram for indexes\_shirtS{' num2str(i) '}']);
end

%histogram(indexes_shirt_L{1}, 20)
%figure()
%histogram(geometricMean_V_24, 20)


indexes_shirt_L_v = cell2mat(indexes_shirt_L);
indexes_shirt_M_v = cell2mat(indexes_shirt_M);
indexes_shirt_S_v = cell2mat(indexes_shirt_S);

z_mean_indexes_shirt_L = mean (indexes_shirt_L_v);
z_var_indexes_shirt_L = var(indexes_shirt_L_v);
z_mean_indexes_shirt_M = mean (indexes_shirt_M_v);
z_var_indexes_shirt_M = var(indexes_shirt_M_v);
z_mean_indexes_shirt_S = mean (indexes_shirt_S_v);
z_var_indexes_shirt_S = var(indexes_shirt_S_v);


y_CIMedian_shirtL_vs_shirtM= estimateCIMedian(indexes_shirt_L_v, indexes_shirt_M_v, alph, iter);
y_CIMean_shirtL_vs_shirtM= estimateCIMean(indexes_shirt_L_v, indexes_shirt_M_v, alph, iter);

y_CIMedian_shirtL_vs_shirtS= estimateCIMedian(indexes_shirt_L_v, indexes_shirt_S_v, alph, iter);
y_CIMean_shirtL_vs_shirtS= estimateCIMean(indexes_shirt_L_v, indexes_shirt_S_v, alph, iter);

y_CIMedian_shirtM_vs_shirtS= estimateCIMedian(indexes_shirt_M_v, indexes_shirt_S_v, alph, iter);
y_CIMean_shirtM_vs_shirtS= estimateCIMean(indexes_shirt_M_v, indexes_shirt_S_v, alph, iter);


x_mean_indexes_shirt_L = cellfun(@mean, indexes_shirt_L);
x_mean_indexes_shirt_M = cellfun(@mean, indexes_shirt_M);
x_mean_indexes_shirt_S = cellfun(@mean, indexes_shirt_S);

x_var_indexes_shirt_L = cellfun(@var, indexes_shirt_L);
x_var_indexes_shirt_M = cellfun(@var, indexes_shirt_M);
x_var_indexes_shirt_S = cellfun(@var, indexes_shirt_S);

figure
histogram(indexes_shirt_L_v, 20);
title(['Histogram for indexes shirt L']);

figure
histogram(indexes_shirt_M_v, 20);
title(['Histogram for indexes shirt M']);

figure
histogram(indexes_shirt_S_v, 20);
title(['Histogram for indexes shirt S']);


tiledlayout(3,1)

nexttile
histogram(indexes_shirt_L_v, 20);
title(['Histogram for indexes shirt L']);

nexttile
histogram(indexes_shirt_M_v, 20);
title(['Histogram for indexes shirt M']);

nexttile
histogram(indexes_shirt_S_v, 20);
title(['Histogram for indexes shirt S']);