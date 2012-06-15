% function Agu = Agu(Int,frequency,Q300,ELJ,EUJ)
% Input : Int - Intensity of transition converted from Log_10
%         MolCal - Calibrated and Truncated spectral data
%         part - Partition function data
%         ELJ - lower state energy in Joules
%         EUJ - upper state energy in Joules
% Calculates Agu in s^(-1) using Agu =
% 2.7964e16*Int*frequency*Q(300)/(exp(-ELJ/(k*300)) - exp(-EUJ/(k*300)))

function Agu = Agu(Int,frequency,Q300,ELJ,EUJ)

k = 1.38065e-23;
Agu =  2.7964E-16.*Int.*frequency.^2.*Q300./(exp(-ELJ/(k*300)) - exp(-EUJ/(k*300)));
