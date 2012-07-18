function [molFreq1, molFreq2, molFreq3, AguList1, AguList2, AguList3, EUJ1, EUJ2, EUJ3] = SplitMol3(molFreq,AguList, EUJ)
%function [molFreq1, molFreq2, AguList1, AguList2, EUJ1, EUJ2] = SplitMol3(molFreq,AguList, EUJ)
% Input: molFreq - molecule frequency list from catalog file
%        AguList - Einstein A times upper state degeneracy for transitions
%        EUJ - upper state energy in Joules
% Output:molFreq1 - odd index molecule frequency list from catalog file
%        molFreq2 - even index molecule frequency list from catalog file
%        AguList1 - odd index Einstein A times upper state degeneracy
%        AguList2 - even index Einstein A times upper state degeneracy
%        EUJ1 - odd index upper state energy in Joules
%        EUJ2 - even index upper state energy in Joules
% Splits the transitions into two seperate sets of transitions

%1
i=1;
j=1;
while(i<=length(molFreq))
    molFreq1(j,1) = molFreq(i);
    AguList1(j,1) = AguList(i);
    EUJ1(j,1) = EUJ(i);
    j=j+1;
    i=i+3;
end

%2
i=2;
j=1;
while(i<=length(molFreq))
    molFreq2(j,1)=molFreq(i);
    AguList2(j,1) = AguList(i);
    EUJ2(j,1) = EUJ(i);
    j=j+1;
    i=i+3;
end

%3
i=3;
j=1;
while(i<=length(molFreq))
    molFreq3(j,1)=molFreq(i);
    AguList3(j,1) = AguList(i);
    EUJ3(j,1) = EUJ(i);
    j=j+1;
    i=i+3;
end