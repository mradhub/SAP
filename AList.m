% function AList = AList(Agu,gu)
% Input : Agu - Einstein A coefficient times upper state degeneracy
%         gu - upper state degeneracy
% Output: AList - Einstein A coefficient
% AList = Agu./gu

function AList = AList(Agu,gu)
AList = Agu./gu;