cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

load('FluxesByVirus.mat');
load('Figure1ByVirus.mat');

SpearmanCorrResults = struct;
SpearmanCorrPVAL = struct;

for field = fieldnames(FluxesByVirus)'
      SpearmanCorrResults.(field{1}) = zeros(numel(FluxesByVirus.H3N2)/4, 1);
      SpearmanCorrPVAL.(field{1}) = zeros(numel(FluxesByVirus.H3N2)/4, 1);
  for i = 1 :numel(FluxesByVirus.H3N2)/4
      x = [FluxesByVirus.(field{1})(i, :)', Figure1ByVirus.(field{1})'];
    [RHO, PVAL] = corr(x, 'type', 'Spearman');
    if (isnan(RHO(2)))
        SpearmanCorrResults.(field{1})(i, :) = 0;
    else
        SpearmanCorrResults.(field{1})(i, :) = RHO(2);
    end
    if (isnan(PVAL(2)))
        SpearmanCorrPVAL.(field{1})(i, :) = 0;
    else
        SpearmanCorrPVAL.(field{1})(i, :) = PVAL(2);
    end
  end
end

save('SpearmanCorrResults.mat', 'SpearmanCorrResults');