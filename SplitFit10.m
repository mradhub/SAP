function SplitFitOut = SplitFit10(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
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

[molFreq,AguList,EUJ] = SplitMol10(molFreq,AguList,EUJ);
i=1
SplitFitOut(2,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,1),obsFreq,obsInt,AguList(:,1),A,EUJ(:,1));
i=2
SplitFitOut(3,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,2),obsFreq,obsInt,AguList(:,2),A,EUJ(:,2));
i=3
SplitFitOut(4,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,3),obsFreq,obsInt,AguList(:,3),A,EUJ(:,3));
i=4
SplitFitOut(5,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,4),obsFreq,obsInt,AguList(:,4),A,EUJ(:,4));
i=5
SplitFitOut(6,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,5),obsFreq,obsInt,AguList(:,5),A,EUJ(:,5));
i=6
SplitFitOut(7,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,6),obsFreq,obsInt,AguList(:,6),A,EUJ(:,6));
i=7
SplitFitOut(8,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,7),obsFreq,obsInt,AguList(:,7),A,EUJ(:,7));
i=8
SplitFitOut(9,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,8),obsFreq,obsInt,AguList(:,8),A,EUJ(:,8));
i=9
SplitFitOut(10,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,9),obsFreq,obsInt,AguList(:,9),A,EUJ(:,9));
i=10
SplitFitOut(11,:) = GoldenLeastSquares3(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq(:,10),obsFreq,obsInt,AguList(:,10),A,EUJ(:,10));
i = 1;
while(i<=9)
    SplitFitOut(1,i) = mean(SplitFitOut(2:end,i));
    i = i+1;
end
Fit = totalSim(molFreq,obsFreq,AguList,A,EUJ,SplitFitOut(1,1),SplitFitOut(1,7),SplitFitOut(1,3),SplitFitOut(1,5));
chi = sqrt(sum((Fit-obsInt).^2));
SplitFitOut(1,9) = chi;
