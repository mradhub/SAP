% function EUPFreq = EUPFreq(ELOFreq,Freq)
% Input : ELOFreq - lower state energy of transition in MHz
%         Freq - frequency of transision in MHz
% Output: EUPFreq - upper state energy in MHz
% Determines upper state energy of the transition in MHz

function EUPFreq = EUPFreq(ELOFreq,Freq)
EUPFreq = ELOFreq + Freq;