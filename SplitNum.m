function [molFreq, AguList, EUJ] = SplitNum(molFreqI,AguListI, EUJI,split)
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
keylength = floor(length(molFreqI)/split);
molFreq = zeros(keylength,split);
AguList = zeros(keylength,split);
EUJ = zeros(keylength,split);
if(keylength>=5 && keylength<10)
    warning('Number of transitions for this fit may be insufficient. Consider using a smaller split number or another fit method.')
end
while(i<=split)
    if(keylength<5)
        warning('Inappropriate use of SplitFitNum, not enough transitions to perform fit. Consider an alternate fit method.')
        break
    end
    key = [i:split:split*keylength];
    molFreq(:,i) = molFreqI(key);
    AguList(:,i) = AguListI(key);
    EUJ(:,i) = EUJI(key);
    i = i+1;
end
size(molFreq)
size(AguList)
size(EUJ)