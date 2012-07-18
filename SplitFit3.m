function SplitFitOut = SplitFit3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
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

[molFreq1,molFreq2,molFreq3,AguList1,AguList2,AguList3,EUJ1,EUJ2,EUJ3] = SplitMol3(molFreq,AguList,EUJ);
'Split 1'
GoldenOutput1 = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq1,obsFreq,obsInt,AguList1,A,EUJ1);
'Split 2'
GoldenOutput2 = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq2,obsFreq,obsInt,AguList2,A,EUJ2);
'Split 3'
GoldenOutput3 = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq3,obsFreq,obsInt,AguList3,A,EUJ3);
SplitFitOut(1,:) = (GoldenOutput1+GoldenOutput2+GoldenOutput3)/3;
SplitFitOut(2,:) = GoldenOutput1;
SplitFitOut(3,:) = GoldenOutput2;
SplitFitOut(4,:) = GoldenOutput3;
Fit = totalSim(molFreq,obsFreq,AguList,A,EUJ,SplitFitOut(1,1),SplitFitOut(1,7),SplitFitOut(1,3),SplitFitOut(1,5));
chi = sqrt(sum((Fit-obsInt).^2));
SplitFitOut(1,9) = chi;
