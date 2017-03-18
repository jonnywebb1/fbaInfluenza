function [ HgncArray ] = GetHGNC( GeneList, GeneValues, GeneKeys )
%returns a cell array of HGNC genes of the model from the passed in gene%values and keys

l = size(GeneList);
HgncArray = cell(l(1),1);

for i = 1 : l(1)
    Temp = find(strcmp(GeneList(i),GeneValues));
    HgncArray(i) = {Temp};
end