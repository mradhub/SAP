function RandFitOut = RandFit(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
%function SplitFitOut = SplitFit3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
%(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU)
% Input: NTL - column density lower limit (cm^-2)
%        NTU - column density upper limit (cm^-2)
%        FWHML - full width half max lower limit (km/s)
%        FWHMU - full width half max upper limit (km/s)
%        tempL - temperature lower limit (K)
%        tempU - temperature upper limit (K)
%        shiftL - shift lower limit (MHz)
%        shiftU - shift upper limit (MHz)
%        molFreq - molecule frequency list from catalog file
%        obsFreq - observational frequency data
%        obsInt - observational intensity data
%        AguList - Einstein A times upper state degeneracy for transitions
%        A - coefficient of partition function fit
%        EUJ - upper state energy in joules
% Output:GoldenOutput = [NTM,NTSig,TempM,TempSig,shiftM,shiftSig,FWHMM,FWHMSig];
% Fit order: NT, Temp, shift, FWHM, NT, FWHM, Temp
% Minimizes function  of sum of squares of errors using a golden section
% search
i = 1;
RandFitOut = zeros(length(molFreq(1,:)),9);
while(i<=length(molFreq(1,:)))
   RandFitOut(i+1,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,i),obsFreq,obsInt,AguList(:,i),A,EUJ(:,i));
   i = i+1; 
end
i = 1;
while(i<=9)
    RandFitOut(1,i) = mean(RandFitOut(2:end,i));
end
Fit = totalSim(molFreq,obsFreq,AguList,A,EUJ,RandFitOut(1,1),RandFitOut(1,7),RandFitOut(1,3),RandFitOut(1,5));
chi = sqrt(sum((Fit-obsInt).^2));
RandFitOut(1,9) = chi;