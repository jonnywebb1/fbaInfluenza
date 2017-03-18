function [ AvgArray ] = CalcAverage( matrixIn )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(matrixIn);

AvgArray = zeros(m,1);

for i = 1 : m
    tot = 0;
    for j = 1 : n
            tot = tot + matrixIn(i,j);
    end
    AvgArray(i,1) = (tot/n);
end

end

