% function EUJ = EUJ(EUPFreq)
% Input : EUPFreq - upper stated energy in MHz
% Output: EUJ - upper state energy in Joules
% EUJ = EUPFreq * 1e6 * h
% h = 6.62606E-34
 
function EUJ = EUJ(EUPFreq)
h = 6.62606E-34;
EUJ = EUPFreq*1e6*h;
