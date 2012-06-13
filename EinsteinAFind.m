% function [AList, Agu] = EinsteinAFind(MolCal,part)
% Input : MolCal - calibrated and truncated spectral data
%         part - partitin function data
% Output: AList - Einstein A coefficients for transitions in s^(-1)
%         AguList - Product of Einstein A coefficient and upper state
%         degeneracy for transition in s^(-1)

function [AList_v,Agu_v,EUJ_v] = EinsteinAFind(MolCal,part)
Int = LogInt(MolCal(:,3));
ELOFreq_v = ELOFreq(MolCal(:,4));
EUPFreq_v = EUPFreq(ELOFreq_v, MolCal(:,1));
ELJ_v = ELJ(ELOFreq_v);
EUJ_v = EUJ(EUPFreq_v);
Agu_v = Agu(Int, MolCal(:,1), part(1,1), ELJ_v, EUJ_v);
AList_v = AList(Agu_v, MolCal(:,5));