%script identifies required genes and averages the values

load('GSE49840Values');
load('GSE49840genes');
load('BioMartHGNClist');
load('BioMartGeneList');
load('recon2.2.mat');

%gets the length of the genes
length = numel(fbarecon.genes);
GSE49840ReconValues = struct;

%mimics structure 
for field = fieldnames(GSE49840Values)'
    GSE49840ReconValues.(field{1}) = struct;
  for subfield = fieldnames(GSE49840Values.(field{1}))'
      %creates array of zeros for length of gene list
     GSE49840ReconValues.(field{1}).(subfield{1}) = zeros(length, 1);
     for i = 1:length
        hgncIndex = find(strcmp(char(fbarecon.genes(i)), BioMartHGNClist)); %finds all instances of the hgnc gene in the biomart hgnc list
        geneValue = BioMartGeneList(hgncIndex); %gets the gene names referenced by the hgnc
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

clearvars j i field subfield length tot gseGeneIndex hgncIndex;


