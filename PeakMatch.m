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
% PeakMatch compares molecule simulation to observational data to determine
% which peaks in an observational data set can be attributed to a given
% molecule

function IDPeaks = PeakMatch(FreqList,IntList,PeakID,totalsim,threshold,thresh)

%find peaks in totalsim
n=2; %start at second point in totalsim
%simlist = zeros(length(totalsim),2);
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