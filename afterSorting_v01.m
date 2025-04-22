
% after sorting
spkTime = index';



% get data from RECORD: gle04c22
record = 'gle04c22'; % 100 trls 60Hz 5 conditions
rec_Spks_perTrl = numberOf_spks_perTrial{29, 1}';

for ii = 1:size(numberOf_spks_perTrial,1)
    numberOf_spks_perTrial{ii,3} = sum(numberOf_spks_perTrial{ii, 1});
end

% isolate trials
allTrls_before = sum([numberOf_spks_perTrial{1:(29-1),3}]);
allTrls_fromThisRec = sum([numberOf_spks_perTrial{29,3}]);

rec_clus = cluster_class(allTrls_before:allTrls_before+allTrls_fromThisRec, :);
rec_wfm = spikes(allTrls_before:allTrls_before+allTrls_fromThisRec, :);

% group by trials & by conditions 
% I know that  % 100 trls 60Hz 5 conditions


% 1st trial == 350 spks
conditions = 5;
rec_trials = reshape(rec_Spks_perTrl, 5, []);

trls_wfm = {}
trls_clus = {}
for ii = 1:size(rec_Spks_perTrl,1)
    
    trl_wfm = [rec_wfm(1:rec_Spks_perTrl(ii),:)];
    trls_wfm{ii,1} = trl_wfm;

    trl_clus = [rec_clus(1:rec_Spks_perTrl(ii),:)];
    trls_clus{ii,1} = trl_clus;
end
trls_wfm = reshape(trls_wfm, conditions, []);
trls_clus = reshape(trls_clus, conditions, []);



% Looking just at 1st trial of condition_1
sua = {}
numClus = unique(trls_clus{1,1}(:,1));
for ii = 1:size(numClus,1)
    sua{ii,1} = trls_wfm{1,1}(trls_clus{1,1}(:,1)==numClus(ii),:);
end


figure
for ii = 1:size(sua,1)
    plot(mean(sua{ii,:},1))
    hold on
end



% concatenate from the same condition
clus_id_cond_1 = trls_clus(1,:);
trls_wfm_cond_1 = trls_wfm(1,:);

% for each cell get the 

numClus = unique(trls_clus{1,1}(:,1));

tot = cellfun(@eachCond_sua, trls_wfm)



function sua = eachCond_sua(trls_wfm,trls_clus,numClus)
    sua = {};
    for ii = 1:size(numClus,1)
        sua{ii,1} = trls_wfm{1,1}(trls_clus{1,1}(:,1)==numClus(ii),:);
    end
end

