% function molSim = molSim(maxTemp,obsFreq,molFreq,FWHM,shift)
% Input : maxTemp - simulated intensity vector
%         obsFreq - observational frequency data
%         molFreq - molecular frequency data
%         NT - simulated column density
%         FWHM - simulated FWHM
%         Temp - simulated temperature
%         shift - shift in MHz
% Output: molSim - single molecule simulated spectrum
% Creates simulated spectrum using gaussian line shapes
% 
function molSim = molSim(maxTemp,obsFreq,molFreq,FWHM_v,shift)
c=299792;
n=1;
molSim=zeros(length(obsFreq),1);
FWHM = FWHM_v*median(obsFreq)/c;
const = FWHM^2/(4*log(2));
while(n<length(maxTemp))
    line = maxTemp(n,1)*exp(-(obsFreq-molFreq(n,1)+shift).^2/const);
    molSim = molSim + line;
    n = n+1;
end
