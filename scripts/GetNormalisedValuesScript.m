cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

%Loops through the values and normalises it against the mock values
load('GSE49840ReconValues');
load('GSE49840MockValues');


GSE49840NormalisedValues = struct;

for field = fieldnames(GSE49840ReconValues)'
      GSE49840NormalisedValues.(field{1}) = struct;
  for subfield = fieldnames(GSE49840Values.(field{1}))'
      GSE49840NormalisedValues.(field{1}).(subfield{1}) = (GSE49840ReconValues.(field{1}).(subfield{1}))./(GSE49840MockValues.(subfield{1}));
      GSE49840NormalisedValues.(field{1}).(subfield{1})(isnan(GSE49840NormalisedValues.(field{1}).(subfield{1}))) = 1;
  end
end