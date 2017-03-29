function [output] = getStructureAverages(data)

output = struct;

for field = fieldnames(data)'
    output.(field{1}) = struct;
  for subfield = fieldnames(data.(field{1}))'
     output.(field{1}).(subfield{1}) = CalcAverage(data.(field{1}).(subfield{1}));
  end
end
