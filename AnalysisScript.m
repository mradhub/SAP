% AnalysisScript.m
% in command window or DefineVars.m must define:
% obspath - string pointing to observational data
% AppEff - variable for apperture efficiency of telescope (between 0 and 1)
% Source - variable for source size in arcmin, 0 if unknown
% Beam - variable for beam size in arcmin
% threshold - variable for minimum threshold for peak in observational data
% molpath - string pointing to molecule spectral data (excluding quantum
% numbers)
% QN molpath - string pointing to quantum number spectral data
% U - upper limit in uncertanty in MHz, 0 if no uncertanty limits
% LI - limit in log_10 intensity, should be a negative number, 0 if no
% uncertanty limits
% parpath - string pointing to molecular partition function data

Dat = importdata(obspath);
DatCal = SpectrumCalibrate(Dat,AppEff,Source,Beam);
[Peaks,PeakList] = PeakList(DatCal,threshold);
Cat = importdata(molpath);
QNCat = importdata(QNmolpath);
[Mol,QNMol] = RenameandKill(Cat,QNCat,U,LI);
[MolCal,QNMolCal] = LimitData(Mol,QNMol,DatCal);
part = importdata(parpath);
A = PartitionFunction(part);
[AList,AguList,EUJ] = EinsteinAFind(MolCal,part);
totalSim = totalSim(MolCal(:,1),DatCal(:,1),AguList,A,EUJ,NT,FWHM,Temp,Shift);
FitSim = LeastSquares(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,MolCal(:,1),DatCal(:,1),DatCal(:,end),AguList,A,EUJ);
%FitSim(1)
%FitSim(2)
%FitSim(3)
%FitSim(4)
%FitSim(5)
%FitSim(6)
%FitSim(7)
%FitSim(8)
IDPeaks=PeakMatch(DatCal(:,1),DatCal(:,end),Peaks(:,end),totalSim,25,2,threshold);
PushResults(IDPeaks,FitSim,totalSim,'C:\Users\widicuslabuser\Desktop\GAL19.61m0.23_B2\',molecule)
if(IDPeaks==0)
    'No Peaks'
end