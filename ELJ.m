% function ELJ = ELJ(ELOFreq)
% Input : ELOFreq - lower stated energy in MHz
% Output: ELJ - lower state energy in Joules
% ELJ = ELOFreq * 1e6 * h
% h = 6.62606E-34
 
function ELJ = ELJ(ELOFreq)
h = 6.62606E-34;
ELJ = ELOFreq*1e6*h;