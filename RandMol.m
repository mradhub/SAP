function [molFreq, AguList, EUJ] = RandMol(molFreq,AguList, EUJ,split)
%function [molFreq, AguList, EUJ] = SplitMol3(molFreq,AguList, EUJ)
% Input: molFreq - molecule frequency list from catalog file
%        AguList - Einstein A times upper state degeneracy for transitions
%        EUJ - upper state energy in Joules
%        split - integer value of how many sets of transitions are desired
% Output: molFreq - new frequency array, randomly selected set from molFreq
% input
%         AguList - new AguList array, randomly selected set from molFreq
%         
% Splits the transitions into 'split' seperate sets of transitions

i=1;
keylength = floor(length(molFreq))/split;
while(i<=split)
    if(keylength<5)
        warning('Inappropriate use of RandMol, not enough transitions to perform fit. Consider an alternate fit method.')
        break
    elseif(keylength>=5 && keylength<10)
        warning('Number of transitions for this fit may be insufficient. Consider using a smaller split number or another fit method.')
    end
    key = random('unid',length(molFreq),keylength,1);
    molFreq(i,:) = molFreq(key);
    AguList(i,:) = AguList(key);
    EUJ(i,:) = EUJ(key);
    i = i+1;
end
