% function IDPeaks = PeakMatch(FreqList,IntList,PeakID,totalsim,threshold,shift,thresh)
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

function [IDPeaks,QuantumList,IDList] = PeakMatch(FreqList,IntList,MolFreq,Agu,QuantumNumbers,EUJ,PeakID,totalsim,threshold)
IDPeaks = 0; %gives IDPeaks an initial value of 0 so that it is not left unassigned if there are no peaks
IDList = MolFreq;
IDList(:,2) = 0;
QuantumList = QuantumNumbers(1);

i = 1; %index through molecule frequency list
k = 1;
j = 1;
threshold = threshold/100;
while(i<=length(MolFreq)) %loop though molecule frequency list
    j=1;
    while(j<=length(FreqList)) %loop though observational frequency list
        %marks frequency as an assigned peak if there is a match in the frequencies
        if(PeakID(j) == 1 && abs(FreqList(j)-MolFreq(i))<=1.5 && (totalsim(j)>=IntList(j)*threshold))
            IDPeaks(k,1) = FreqList(j); %assigns transition frequency to observational frequency
            IDPeaks(k,2) = totalsim(j); %assigns transition intensity to simulated intensity
            IDPeaks(k,3) = IntList(j); %gives observational intensity
            IDPeaks(k,4) = Agu(i); %gives Einstein A coefficient times upper state degeneracy for transition
            IDPeaks(k,5) = EUJ(i); %gives upper state energy in joules for transition
            %QuantumNumbers(i)            
            QuantumList(k) = QuantumNumbers(i);
            k=k+1;
            IDList(i,2) = 1;            
        end
        j=j+1;
    end
    i=i+1;
end


%{
%find peaks in totalsim
n=2; %start at second point in totalsim
simlist = [0;0];
while(n<=length(totalsim))
    if(totalsim(n-1)<totalsim(n) && totalsim(n+1)<totalsim(n) && totalsim(n)>=thresh )
        simlist(n,1)=1;
        simlist(n,2)=totalsim(n);
    end
    n=n+1;
end
sum(simlist(:,1));
sum(PeakID);
threshold = threshold/100;

%compare peaks in totalsim to observational peaks
%make comparision by looking at where simlist(n,1) and PeakID(n) both equal
%1, or the 1's are near each other.
n=2;
i=1;
IDPeaks = [0;0;0;0];
while(n<=length(simlist))%loop going through simulation
    if(simlist(n,1)==1 && PeakID(n)==1&&(simlist(n,2)>=IntList(n)*threshold))
        IDPeaks(i,1) = FreqList(n);
        IDPeaks(i,2) = totalsim(n);
        IDPeaks(i,3) = IntList(n);
        IDPeaks(i,4) = 0;
        i=i+1;
    elseif(simlist(n,1)==1 && PeakID(n-1)==1 && simlist(n,2)>=IntList(n-1)*threshold)
        IDPeaks(i,1) = FreqList(n-1);
        IDPeaks(i,2) = totalsim(n);
        IDPeaks(i,3) = IntList(n-1);
        IDPeaks(i,4) = -1;
        i=i+1;
    elseif(simlist(n,1)==1 && PeakID(n+1)==1 && simlist(n,2)>=IntList(n+1)*threshold)
        IDPeaks(i,1) = FreqList(n+1);
        IDPeaks(i,2) = totalsim(n);
        IDPeaks(i,3) = IntList(n+1);
        IDPeaks(i,4) = 1;
        i=i+1;
    elseif(simlist(n,1)==1 && PeakID(n-2)==1 && simlist(n,2)>=IntList(n-2)*threshold)
        IDPeaks(i,1) = FreqList(n-2);
        IDPeaks(i,2) = totalsim(n);
        IDPeaks(i,3) = IntList(n-2);
        IDPeaks(i,4) = -2;
        i=i+1;
    elseif(simlist(n,1)==1 && PeakID(n+2)==1 && simlist(n,2)>=IntList(n+2)*threshold)
        IDPeaks(i,1) = FreqList(n+2);
        IDPeaks(i,2) = totalsim(n);
        IDPeaks(i,3) = IntList(n+2);
        IDPeaks(i,4) = 2;
        i=i+1;
    %elseif(simlist(n,1)==1)
     %   FreqList(n)
    end
    n=n+1;
end
%}


%{
while(n<=length(simlist))%loop going thorugh simulation
    if(((simlist(n,1)==1 && PeakID(n)==1&&(simlist(n)>=IntList(n)*threshold))||(simlist(n,1)==1 && PeakID(n-1)==1&&(simlist(n)>=IntList(n-1)*threshold))||(simlist(n,1)==1 && PeakID(n+1)==1 &&(simlist(n)>=IntList(n+1)*threshold))||(simlist(n,1)==1 && PeakID(n-2)==1 &&(simlist(n)>=IntList(n-2)*threshold))||(simlist(n,1)==1 && PeakID(n+2)==1)&&(simlist(n)>=IntList(n+2)*threshold)))
        IDPeaks(i,1) = FreqList(n);
        IDPeaks(i,2) = totalsim(n);
        IDPeaks(i,3) = IntList(n);
        i=i+1;
    end
    n=n+1;
end
%}


%{
%compare peaks in totalsim to observational peaks
IDPeaks(1,1)=0;
i=1;
n=1;
while(n<=length(simlist))%loop going through simulation
    m=1;
    while(m<=length(FreqList))%loop going through observation
        if(PeakID(m)==1 && abs(FreqList(m)-simlist(n,2))<shift && totalsim(simlist(n,1))>=IntList(m)*(threshold/100)&&totalsim(simlist(n,1))>=thresh)
            %point must be a peak, frequencies must match, and intensity must be greater than threshold
            IDPeaks(i,1)=FreqList(simlist(n,1));
            IDPeaks(i,2)=totalsim(simlist(n,1));
            IDPeaks(i,3)=(FreqList(m)-simlist(n,2));
            IDPeaks(i,4)=IntList(m)/totalsim(simlist(n,1))*100;
            i=i+1;
        end
        m=m+1;
    end
    n=n+1;
end
%}