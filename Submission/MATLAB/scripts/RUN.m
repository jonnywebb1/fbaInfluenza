%control script, Runs all scripts in correct order.
cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

load('GSE49840');
load('BioMartGeneList');
load('BioMartHGNClist');
load('Figure1ByVirus');
load('Figure1');
load('recon2.2')

getStructureAverages;
GetReconGenes;
GetNormalisedValuesScript;
RunFlux;
SortFluxes;
