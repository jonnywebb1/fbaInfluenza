AllFluxes = zeros(7785, 16); %matrix for all
FluxesByVirus = struct; % 4*7785 matrix for each virus

int = 1;

for field = fieldnames(GSE49840FluxResults)'
    FluxesByVirus.(field{1}) = zeros(7785, 4);
    x = 1;
  for subfield = fieldnames(GSE49840FluxResults.(field{1}))'
      AllFluxes(:, int) = GSE49840FluxResults.(field{1}).(subfield{1});
      FluxesByVirus.(field{1})(:, x) = GSE49840FluxResults.(field{1}).(subfield{1});
      int = int + 1;
      x = x + 1;
  end
end