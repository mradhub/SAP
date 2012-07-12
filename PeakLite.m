% function IDPeaks = PeakLite(FreqList,IntList,PeakID,totalsim,threshold,shift,thresh)
% Input : FreqList - Frequency List of peak locations
%         IntList - Intensity List of peaks
%         PeakID - =1 if peak, = 0 if no peak
%         totalsim - simulation to be compared to observational data
%         threshold - % threshold of peak allowed to be considered a peak.
%         I recommend 25%
%         shift - allowed frequency shift between observed line and
%         simulated line.  I recommend 2 MHz or less
%         thresh - should be same as peak threshold for observational peaks
% Output: IDPeaks - Array of identified peaks including frequency,
% intensity, shift, and % of peak height
%         QuantumList - list of quantum numbers for each observed
%         transition
%         IDList - list of all transitions by frequency.  IDList(:,1) is
%         the frequency list. IDList(:,2) 1 if the transition is observed,
%         0 otherwise.
% PeakMatch compares molecule simulation to observational data to determine
% which peaks in an observational data set can be attributed to a given
% molecule

function [IDPeaks] = PeakLite(FreqList,IntList,MolFreq,Agu,EUJ,PeakID,totalsim,threshold,shift)
IDPeaks = 0; %gives IDPeaks an initial value of 0 so that it is not left unassigned if there are no peaks
IDList = MolFreq;
IDList(:,2) = 0;

i = 1; %index through molecule frequency list
k = 1;
j = 1;
threshold = threshold/100;
while(i<=length(MolFreq)) %loop though molecule frequency list
    j=1;
    while(j<=length(FreqList)) %loop though observational frequency list
        %marks frequency as an assigned peak if there is a match in the frequencies
        if(PeakID(j) == 1 && abs(FreqList(j)-(MolFreq(i)+shift))<=2 && (totalsim(j)>=IntList(j)*threshold) &&totalsim(j)>=.03)
            IDPeaks(k,1) = FreqList(j); %assigns transition frequency to observational frequency
            IDPeaks(k,2) = totalsim(j); %assigns transition intensity to simulated intensity
            IDPeaks(k,3) = IntList(j); %gives observational intensity
            IDPeaks(k,4) = Agu(i); %gives Einstein A coefficient times upper state degeneracy for transition
            IDPeaks(k,5) = EUJ(i); %gives upper state energy in joules for transition
            k=k+1;    
        end
        j=j+1;
    end
    i=i+1;
end
