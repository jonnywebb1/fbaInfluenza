function [ geneValues ] = GetAverageGeneValues(HGNCarrayIn, BioMartGeneNamein, datasetArray, datasetGeneList)
%returns an array of containing the average value for that HGNC gene from the dataset

l = length(HGNCarrayIn);
geneValues = zeros(l,1);

for i = 1 : l(1)
    if not(isempty(HGNCarrayIn(i)))
        totalValue = 0;
        tot = 1;
        vals = HGNCarrayIn(i);
        vals = [vals{:}];
        for j = 1 : length(vals)
            if not(strcmp(BioMartGeneNamein(vals(j)), ""))
                geneName = BioMartGeneNamein(vals(j));
                geneIndex = find(contains(datasetGeneList, geneName));
                totalValue = totalValue + sum(datasetArray(geneIndex));
                tot = tot+1;
            end
        end
        geneValues(i) = (totalValue/tot);
    end
end
