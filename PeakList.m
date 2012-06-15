% function Peaks = PeakList(DatCal,threshold)
% Input : DatCal - Calibrated observational data
%         threshold - minimum threshold intensity for peak.  This should be
%         3-sigma of noise
% Output: Peaks(1,:) - Frequencies of peaks in observational data
%         Peaks(2,:) - intensities of peaks in observational data
%         Peaks(3,:) - 1 if data point is a peak, 0 if not a peak
%         PeakList(1,:) - Frequencies of peaks in observational data
%         PeakList(2,:) - intensities of peaks in observational data

function [Peaks,PeaksList] = PeakList(DatCal,threshold)
Peaks=zeros(length(DatCal(:,1)),3);
m=2;
n=1;
while(m<length(DatCal))
   if(DatCal(m-1,end)<DatCal(m,end) && DatCal(m+1,end)<DatCal(m,end) && DatCal(m,end)>threshold)
       Peaks(m,1)=DatCal(m,1);
       PeaksList(n,1) = DatCal(m,1);
       Peaks(m,2)=DatCal(m,end);
       PeaksList(n,2)=DatCal(m,end);
       Peaks(m,3)=1;
       n=n+1;
   end
   m=m+1;
end

