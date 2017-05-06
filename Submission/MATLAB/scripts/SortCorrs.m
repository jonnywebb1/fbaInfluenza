cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

load('CorrResults.mat')

AllCorrs = zeros(7785, 4); %matrix for all

int = 1;

for field = fieldnames(CorrResults)'
    FluxesByVirus.(field{1}) = zeros(7785, 1);
    AllCorrs(:, int) = CorrResults.(field{1});
    int = int + 1;
end
cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza\models');
save('fluxes', 'AllFluxes', 'FluxesByVirus');