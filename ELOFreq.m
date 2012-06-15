% function ELOFreq = ELOFreq(ELwave)
% Input : ELwave - Lower state energy in wavenumbers
% Output: ELOFreq - Lower state energy in MHz
% converts lower state energy in wavenumbers to lower state energy in MHz

function ELOFreq = ELOFreq(ELWave)
ELOFreq = ELWave*29979;