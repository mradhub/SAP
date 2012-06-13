% function maxTemp = MaxTempCalc(molFreq,Agu,ACo,EU,NT,Temp,FWHM)
% Imput : molFreq - molecular transition frequency vector
%         Agu - molecular transition Agu vector
%         ACo - Coefficient of partition function fit
%         EU - upper state energy in Joules
%         NT - column density to simulate spectrum
%         Temp - temperature to simulate spectrum
%         FWHM - FWHM of line to simulate spectrum
% Output: maxTemp - Simulated intensity of transition
% maxTemp =
% (h*c^3)/(8*pi*k*molFreq^2)*(Agu*NT)/(ACo*Temp^(3/2))*(molFreq)/
% (c*FWHM*1.064)*exp(-EU/(k*Temp))*1e-8

function maxTemp = MaxTempCalc(molFreq,Agu,ACo,EU,NT,Temp,FWHM)
h = 6.62606E-34;
k = 1.30865E-23;
c = 2.9979E+8;

part1 = (h*c^3)./(8*pi*k*molFreq.^2);
part2 = (Agu.*NT)/(ACo*Temp^(3/2));
part3 = exp(-EU/(k*Temp));
IntInt = part1.*part2.*part3*1E-11;
maxTemp = IntInt/(1.064*FWHM);
