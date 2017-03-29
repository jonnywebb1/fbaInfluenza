function [ HgncArray ] = GetHGNCIndex( ModelGeneList, BioMartHGNCList )
%returns a cell array of HGNC genes of the model from the passed in gene%values and keys

l = size(ModelGeneList);
HgncArray = cell(l(1),1);

for i = 1 : l(1)
    Temp = find(strcmp(BioMartHGNCList, ModelGeneList(i)));
    HgncArray(i) = {Temp};
end