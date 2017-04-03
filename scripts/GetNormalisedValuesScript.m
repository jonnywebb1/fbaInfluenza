

for field = fieldnames(GSE49840Values)'
      GSE49840NormalisedValues.(field{1}) = struct;
  for subfield = fieldnames(GSE49840Values.(field{1}))'
      GSE49840NormalisedValues.(field{1}).(subfield{1}) = (GSE49840Values.(field{1}).(subfield{1}))./(GSE49840MockValues.(subfield{1}));
      GSE49840NormalisedValues.(field{1}).(subfield{1})(isnan(GSE49840NormalisedValues.(field{1}).(subfield{1}))) = 1;
  end
end