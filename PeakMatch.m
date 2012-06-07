% function IDPeaks = PeakMatch(FreqList,IntList,PeakID,totalsim,threshold,shift)
% Input : FreqList - Frequency List of peak locations
%         IntList - Intensity List of peaks
%         PeakID - =1 if peak, = 0 if no peak
%         totalsim - simulation to be compared to observational data
%         threshold - % threshold of peak allowed to be considered a peak.
%         I recommend 25%
%         shift - allowed frequency shift between observed line and
%         simulated line.  I recommend 2 MHz or less
% Output: IDPeaks - Array of identified peaks including frequency,
% intensity, shift, and % of peak height
% PeakMatch compares molecule simulation to observational data to determine
% which peaks in an observational data set can be attributed to a given
% molecule

function IDPeaks = PeakMatch(FreqList,IntList,PeakID,totalsim,threshold,shift)

%find peaks in totalsim
n=2; %start at second point in totalsim
%simlist = zeros(length(totalsim),2);
m=1;
while(n<=length(totalsim))
    if(totalsim(n-1)<totalsim(n) && totalsim(n+1)<totalsim(n))
        simlist(m,1)=n;
        simlist(m,2)=FreqList(n);
        m=m+1;
    end
    n=n+1;
end

%compare peaks in totalsim to observational peaks
i=1;
n=1;
while(n<=length(simlist))%loop going through simulation
    m=1;
    while(m<=length(FreqList))%loop going through observation
        if(PeakID(m)==1 && abs(FreqList(m)-simlist(n,2))<shift && totalsim(simlist(n,1))>=IntList(m)*(threshold/100))
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