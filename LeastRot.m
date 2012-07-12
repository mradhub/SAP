%function RotSim = LeastRot(NTL, NTU, FWHML, FWHMU, tempL, tempU, shiftL, shiftU, molFreq, obsFreq, obsInt, AguList, A, EUJ, threshold)
% Input: NTL - column density lower limit (cm^-2)
%        NTU - column density upper limit (cm^-2)
%        FWHML - full width half max lower limit (km/s)
%        FWHMU - full width half max upper limit (km/s)
%        tempL - temperature lower limit (K)
%        tempU - temperature uppper limit (K)
%        shiftL - shift lower limit (MHz)
%        shiftU - shift upper limit (MHz)
%        molFreq - molecule frequency list from catalog file
%        obsFreq - observational frequency data
%        obsInt - observational intensity data
%        AguList - Einstein A times upper state degeneracy for transitions
%        A - coefficient of partition function fit
%        EUJ - upper state energy in joules
%        threshold - 3-sigma noise threshold in observational data
% Output:RotSim = [NTM,NTSig,TempM,TempSig,shiftM,shiftSig,FWHMM,FWHMSig];

function RotSim = LeastRot(NTL, NTU, FWHML, FWHMU, tempL, tempU, shiftL, shiftU, molFreq, obsFreq, obsInt, AguList, A, EUJ,threshold)
FitSim = LeastSquares(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ);
[Peaks, PeaksList] = PeakList(obsFreq,obsInt,threshold);
Simulation = totalSim(molFreq,obsFreq,AguList,A,EUJ,FitSim(1),FitSim(7),FitSim(3),FitSim(5));
[IDPeaks]=PeakLite(obsFreq,obsInt,molFreq,AguList,EUJ,Peaks(:,end),Simulation,25,FitSim(5));
k =  1.38065e-23;
h = 6.62606E-34; 
c = 2.9979E+8;
const = (8*pi*k*1.064*FitSim(7))/(h*c^3);
lnstuff = log((IDPeaks(:,1).^2.*IDPeaks(:,3)*const)./IDPeaks(:,4));
EUK = IDPeaks(:,5)/k;
p = polyfit(EUK,lnstuff,1)
Trot = -1/p(1);
NT = exp(p(2))*A*Trot^(3/2);
RotSim(1) = Trot;
RotSim(2)  = NT;
plot(EUK,lnstuff,'ro')
hold on
plot(EUK,polyval(p,EUK),'b-')