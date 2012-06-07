% function [MolCal,QNMolCal] = LimitData(Mol,QNMol)
% Input : Mol - catalog data after processing through RenameandKill
%         QNMol - quantum number data after processing through
%         RenameandKill
%         DatCal - calibrated observational data
% Output: MolCal - catalog data truncated to same frequency as
%         observational frequency
%         QNMolCal - quantum number data truncated to same frequency as
%         observational frequency

function [MolCal, QNMolCal] = LimitData(Mol,QNMol,DatCal)
m = 1;
n = 1;
min = DatCal(1,1);
max = DatCal(end,1);
while(m<=length(Mol))
    if(Mol(m,1)>min && Mol(m,1)<max)
        MolCal(n,:)=Mol(m,:);
        QNMolCal(n)=QNMol(m);
        n = n+1;
    end
    m=m+1;
end