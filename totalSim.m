% totalSim = totalSim(molFreq,obsFreq,obsInt,NT,FWHM,Temp,Shift)
% Imput : molFreq - frequency of molecule transitions
%         obsFreq - observational frequency
%         obsInt - observational intensity
%         AguList - AguList for molecule transitions
%         A - A coefficient from partition function fit
%         NT - column density
%         FWHM - full width half max
%         Temp - temperature
%         Shift - shift in MHz
% Output: totalSim - output wave of total simulation from molSim
% Creates simulation wave and outputs plot

function totalSim = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift)

maxTemp = MaxTempCalc(molFreq,AguList,A,EUJ,NT,Temp,FWHM);
totalSim = molSim(maxTemp,obsFreq,molFreq,FWHM,Shift);

%plot(obsFreq,obsInt,'r-')
%hold on
%plot(obsFreq,totalSim,'b-')
%hold on
%plot(molFreq,maxTemp,'go')
