%% adjust data before sorting (wave_clus) && runs wave_clus sorting (calling Do_clustering function) && saves post-sorting info 


%%  All data must be in double to run wave_clus spikeSorting method!
spikes(1:2, 1:5)

% Load your data first
data_path = '/home/estevao/Documents/visLab/analise_estevao/handleData4sorting_estevao/data_4_sorting/spkData_gle04b/data4sorting_gle04b.mat';
load(data_path);

% Check the data type of your spikes variable
whos spikes

% If needed, convert to double
if ~isa(spikes, 'double') && ~isa(spikes, 'single')
    spikes = double(spikes);
end


% savenew data
%savePath = '/home/estevao/Documents/visLab/analise_estevao/handleData4sorting_estevao/data_4_sorting/spkData_gle04d/doubled_data4sorting_gle04d.mat';
savePath = '/home/estevao/Documents/visLab/analise_estevao/handleData4sorting_estevao/data_4_sorting/spkData_gle04b/novoCont_doubled_data4sorting_gle04b.mat';
save(savePath,  "spikes", "index")


% Call the function with the spikes data
%data_path = '/home/estevao/Documents/visLab/analise_estevao/handleData4sorting_estevao/data_4_sorting/spkData_gle04b/doubled_data4sorting_gle04b.mat';
parameters = '/home/estevao/Documents/visLab/analise_estevao/handleData4sorting_estevao/set_parameters_estevao.m';
data_path = '/home/estevao/Documents/visLab/analise_estevao/handleData4sorting_estevao/data_4_sorting/spkData_gle04b/novoCont_doubled_data4sorting_gle04b.mat';

Do_clustering(data_path, 'par_file', parameters);



