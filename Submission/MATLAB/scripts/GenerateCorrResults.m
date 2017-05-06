cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

load('FluxesByVirus.mat');
load('Figure1ByVirus.mat');

CorrResults = struct;
CorrPVAL = struct;

for field = fieldnames(FluxesByVirus)'
      CorrResults.(field{1}) = zeros(numel(FluxesByVirus.H3N2)/4, 1);
      CorrPVAL.(field{1}) = zeros(numel(FluxesByVirus.H3N2)/4, 1);
  for i = 1 :numel(FluxesByVirus.H3N2)/4
      x = [FluxesByVirus.(field{1})(i, :)', Figure1ByVirus.(field{1})'];
    [RHO, PVAL] = corr(x, 'type', 'Pearson');
    if (isnan(RHO(2)))
        CorrResults.(field{1})(i, :) = 0;
    else
        CorrResults.(field{1})(i, :) = RHO(2);
    end
    if (isnan(PVAL(2)))
        CorrPVAL.(field{1})(i, :) = 0;
    else
        CorrPVAL.(field{1})(i, :) = PVAL(2);
    end
  end
end

save('CorrResults.mat', 'CorrResults');