%addpath(genpath('C:\Program Files\MATLAB\R2015b\toolbox\cobra'));
%initCobraToolbox

load('geni_names.mat');   
load('reaction_expression.mat');
load('recon2.2.mat');
load('pos_genes_in_react_expr.mat');
load('ixs_geni_sorted_by_length.mat');
load('GEO_sample_data_struct.mat');

genes = fbarecon.genes;
genes_in_dataset = GEO_sample_data_struct.HGNC_ID;

M = 2; %number of objectives
V = numel(genes); %number of variables

%% Flux distribution control
%%
x = ones(numel(genes),1);  %we start from the all-one configuration
[v1_control, f_out_control] = evaluate_objective(x,M,V,fbarecon,genes,reaction_expression,pos_genes_in_react_expr,ixs_geni_sorted_by_length);   


%% Flux distribution disease
%%
expr_profile = GEO_sample_data_struct.fc;
pos_genes_in_dataset = zeros(numel(genes),1);

for i=1:numel(genes)
    position = find(strcmp(genes{i},genes_in_dataset));
    if ~isempty(position)
        pos_genes_in_dataset(i) = position;
        x(i) = expr_profile(pos_genes_in_dataset(i));
    end
end

V = numel(genes);
[v1, f_out] = evaluate_objective(x,M,V,fbarecon,genes,reaction_expression,pos_genes_in_react_expr,ixs_geni_sorted_by_length);   

