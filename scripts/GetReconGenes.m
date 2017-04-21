%script identifies required genes and averages the values
cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

load('GSE49840Values');
load('GSE49840genes');
load('BioMartHGNClist');
load('BioMartGeneList');
load('recon2.2.mat');

%gets the length of the genes
length = numel(fbarecon.genes);
GSE49840ReconValues = struct;

hgncIndices = zeros(length, 1);

%gets the indices for genes (only needs to be found once)
for field = fieldnames(GSE49840Values)'
    for subfield = fieldnames(GSE49840Values.(field{1}))'
        for i = 1:length
        hgncIndices(i) = find(strcmp(char(fbarecon.genes(i)), BioMartHGNClist)); %finds all instances of the hgnc gene in the biomart hgnc list
        end
    end
end


%mimics structure 
for field = fieldnames(GSE49840Values)'
    GSE49840ReconValues.(field{1}) = struct;
  for subfield = fieldnames(GSE49840Values.(field{1}))'
      %creates array of zeros for length of gene list
     GSE49840ReconValues.(field{1}).(subfield{1}) = zeros(length, 1);
     for i = 1:length
        geneValue = BioMartGeneList(hgncIndices(i)); %gets the gene names referenced by the hgnc
        tot = 0;
        for j = 1:numel(geneValue) %loop averages values for all measurements by gene name
            gseGeneIndex = find(strcmp(geneValue(j), GSE49840genes));
            if not(isempty(GSE49840Values.(field{1}).(subfield{1})(gseGeneIndex)))
                tot = tot + GSE49840Values.(field{1}).(subfield{1})(gseGeneIndex);
            end
        end
            GSE49840ReconValues.(field{1}).(subfield{1})(i, 1) = tot/j;
     end 
  end
end

%sepearate the mock values and remove it
GSE49840MockValues = GSE49840ReconValues.Mock;
GSE49840ReconValues = rmfield(GSE49840ReconValues, Mock);

cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza\models');
save('GSE49840ReconValues', 'GSE49840ReconValues');
save('GSE49840MockValues', 'GSE49840MockValues');

clearvars j i field subfield length tot gseGeneIndex hgncIndices;


