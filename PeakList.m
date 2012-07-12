% function Peaks = PeakList(DatCal,threshold)
% Input : Freq - observational frequency data
%         Int - observational intensity data
%         threshold - minimum threshold intensity for peak.  This should be
%         3-sigma of noise
% Output: Peaks(1,:) - Frequencies of peaks in observational data
%         Peaks(2,:) - intensities of peaks in observational data
%         Peaks(3,:) - 1 if data point is a peak, 0 if not a peak
%         PeakList(1,:) - Frequencies of peaks in observational data
%         PeakList(2,:) - intensities of peaks in observational data

function [Peaks,PeaksList] = PeakList(Freq,Int,threshold)
Peaks=zeros(length(Freq),3);
m=2;
n=1;
while(m<length(Freq))
   if(Int(m-1)<Int(m) && Int(m+1)<Int(m) && Int(m)>threshold)
       Peaks(m,1)=Freq(m);
       PeaksList(n,1) = Freq(m);
       Peaks(m,2)=Int(m);
       PeaksList(n,2)=Int(m);
       Peaks(m,3)=1;
       n=n+1;
   end
   m=m+1;
end

