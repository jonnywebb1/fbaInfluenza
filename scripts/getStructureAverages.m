cd('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza');
addpath(genpath('C:\Users\Jonny\Docs\Uni Stuff\Project\fbaInfluenza'));

%Calculates the average of the GSE49840 value structure

load('GSE49840');

GSE49840Values = struct;

for field = fieldnames(GSE49840)'
    GSE49840Values.(field{1}) = struct;
  for subfield = fieldnames(GSE49840.(field{1}))'
     GSE49840Values.(field{1}).(subfield{1}) = CalcAverage(GSE49840.(field{1}).(subfield{1}));
  end
end
