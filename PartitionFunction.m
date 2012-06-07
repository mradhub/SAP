% function A = PartitionFunction(part)
% Input : part - partition function data as Q(T),T
% Output: A - coefficient A of the fit function Q(T)=A*T^(3/2)
function A = PartitionFunction(part)
partition = @(A0,x) A0*x.^(3/2);
A0 = 1;
A = nlinfit(part(:,2), part(:,1), partition, A0);
