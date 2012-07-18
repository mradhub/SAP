function [molFreq, AguList, EUJ] = SplitMol10(molFreq,AguList, EUJ)
%function [molFreq, AguList, EUJ] = SplitMol(molFreq,AguList, EUJ)
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
    molFreq(j,1) = molFreq(i);
    AguList(j,1) = AguList(i);
    EUJ(j,1) = EUJ(i);
    j=j+1;
    i=i+10;
end

%2
i=2;
j=1;
while(i<=length(molFreq))
    molFreq(j,2)=molFreq(i);
    AguList(j,2) = AguList(i);
    EUJ(j,2) = EUJ(i);
    j=j+1;
    i=i+10;
end

%3
i=3;
j=1;
while(i<=length(molFreq))
    molFreq(j,3)=molFreq(i);
    AguList(j,3) = AguList(i);
    EUJ(j,3) = EUJ(i);
    j=j+1;
    i=i+10;
end

%4
i=4;
j=1;
while(i<=length(molFreq))
    molFreq(j,4)=molFreq(i);
    AguList(j,4) = AguList(i);
    EUJ(j,4) = EUJ(i);
    j=j+1;
    i=i+10;
end

%5
i=5;
j=1;
while(i<=length(molFreq))
    molFreq(j,5)=molFreq(i);
    AguList(j,5) = AguList(i);
    EUJ(j,5) = EUJ(i);
    j=j+1;
    i=i+10;
end

%6
i=6;
j=1;
while(i<=length(molFreq))
    molFreq(j,6)=molFreq(i);
    AguList(j,6) = AguList(i);
    EUJ(j,6) = EUJ(i);
    j=j+1;
    i=i+10;
end

%7
i=7;
j=1;
while(i<=length(molFreq))
    molFreq(j,7)=molFreq(i);
    AguList(j,7) = AguList(i);
    EUJ(j,7) = EUJ(i);
    j=j+1;
    i=i+10;
end

%8
i=8;
j=1;
while(i<=length(molFreq))
    molFreq(j,8)=molFreq(i);
    AguList(j,8) = AguList(i);
    EUJ(j,8) = EUJ(i);
    j=j+1;
    i=i+10;
end

%9
i=9;
j=1;
while(i<=length(molFreq))
    molFreq(j,9)=molFreq(i);
    AguList(j,9) = AguList(i);
    EUJ(j,9) = EUJ(i);
    j=j+1;
    i=i+10;
end

%10
i=10;
j=1;
while(i<=length(molFreq))
    molFreq(j,10)=molFreq(i);
    AguList(j,10) = AguList(i);
    EUJ(j,10) = EUJ(i);
    j=j+1;
    i=i+10;
end