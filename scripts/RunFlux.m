cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

%Script copies GSE49840NormalisedValues structure and populates with flux
%results 

load('recon2.2.mat');
load('GSE49840NormalisedValues');
load('pos_genes_in_react_expr.mat');
load('ixs_geni_sorted_by_length.mat');
load('reaction_expression.mat');

genes = fbarecon.genes;

M = 2; %number of objectives
V = numel(genes); %number of variables

GSE49840FluxResults = struct;

for field = fieldnames(GSE49840NormalisedValues)'
      GSE49840FluxResults.(field{1}) = struct;
  for subfield = fieldnames(GSE49840NormalisedValues.(field{1}))'
      x = GSE49840NormalisedValues.(field{1}).(subfield{1});
      GSE49840FluxResults.(field{1}).(subfield{1}) = evaluate_objective(x,M,V,fbarecon,genes,reaction_expression,pos_genes_in_react_expr,ixs_geni_sorted_by_length);;
  end
end

clearvars M field subfield x V;