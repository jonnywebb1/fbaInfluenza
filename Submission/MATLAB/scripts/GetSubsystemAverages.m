l = length(list_of_subsystems);
subsystemVals = zeros(l,1);

SpearmanPVALCorrSubsystemAvgs = struct;
CorrPVALSubsystemAvgs = struct;


for i = 1 : l(1)
    indices = find(strcmp(list_of_subsystems(i), fbarecon.subSystems));
    
    for field = fieldnames(CorrPVAL)'
        x = 0;
        y = 0;
        for j = 1 : numel(indices)
            x = x + CorrPVAL.(field{1})(indices(j));
            y = y + SpearmanCorrPVAL.(field{1})(indices(j));
        end
        SpearmanCorrSubsystemAvgs.(field{1})(i,1) = x/j;
        CorrPVALSubsystemAvgs.(field{1})(i,1) = y/j;
    end
end
