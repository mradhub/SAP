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
[Peaks,PeakList] = PeakList(DatCal(:,1),DatCal(:,end),threshold);

Cat1 = importdata(molpath1);
QNCat1 = importdata(QNmolpath1);
[Mol1,QNMol1] = RenameandKill(Cat1,QNCat1,U,LI);
[MolCal1,QNMolCal1] = LimitData(Mol1,QNMol1,DatCal);
part1 = importdata(parpath1);
A1 = PartitionFunction(part1);
[AList1,AguList1,EUJ1] = EinsteinAFind(MolCal1,part1);

Cat2 = importdata(molpath2);
QNCat2 = importdata(QNmolpath2);
[Mol2,QNMol2] = RenameandKill(Cat2,QNCat2,U,LI);
[MolCal2,QNMolCal2] = LimitData(Mol2,QNMol2,DatCal);
part2 = importdata(parpath2);
A2 = PartitionFunction(part2);
[AList2,AguList2,EUJ2] = EinsteinAFind(MolCal2,part2);

%totalSim = totalSim(MolCal(:,1),DatCal(:,1),AguList,A,EUJ,NT,FWHM,Temp,Shift);
%{
FitSim = RandFit(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,MolCal(:,1),DatCal(:,1),DatCal(:,end),AguList,A,EUJ,split,keylength);
totalSim = totalSim(MolCal(:,1),DatCal(:,1),AguList,A,EUJ,FitSim(1,1),FitSim(1,7),FitSim(1,3),FitSim(1,5));
[IDPeaks,QuantumList,IDList]=PeakMatch(DatCal(:,1),DatCal(:,end),MolCal(:,1),AguList,QNMolCal,EUJ,Peaks(:,end),totalSim,25,FitSim(5));
PushResults(IDPeaks,FitSim,totalSim,'C:\Users\widicuslabuser\Desktop\Orion\',molecule)
plot(DatCal(:,1),DatCal(:,end),'r-')
hold on
plot(DatCal(:,1),totalSim,'b-')
if(IDPeaks==0)
    'No Peaks'
end


FitSim(:,1)
FitSim(:,2)
FitSim(:,3)
FitSim(:,4)
FitSim(:,5)
FitSim(:,6)
FitSim(:,7)
FitSim(:,8)
FitSim(:,9)
%}


%{
%plot(DatCal(:,1),DatCal(:,end),'r-')
%hold on
%plot(DatCal(:,1),totalSim)
%FitSim(1),FitSim(2),FitSim(3),FitSim(4),FitSim(5),FitSim(6),FitSim(7),FitSim(8),FitSim(9)

RotSim = LeastRot(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,MolCal(:,1),DatCal(:,1),DatCal(:,end),AguList,A,EUJ,threshold);
totalSim = totalSim(MolCal(:,1),DatCal(:,1),AguList,A,EUJ,RotSim(2),FitSim(7),RotSim(1),FitSim(5));
%FitSim(1)
%FitSim(2)
%FitSim(3)
%FitSim(4)
%FitSim(5)
%FitSim(6)
%FitSim(7)
%FitSim(8)
figure
plot(DatCal(:,1),DatCal(:,end),'r-')
hold on
plot(DatCal(:,1),totalSim,'b-')
[IDPeaks,QuantumList,IDList]=PeakMatch(DatCal(:,1),DatCal(:,end),MolCal(:,1),AguList,QNMolCal,EUJ,Peaks(:,end),totalSim,25,FitSim(5));
PushResults(IDPeaks,FitSim,totalSim,'C:\Users\widicuslabuser\Desktop\Orion\',molecule)
if(IDPeaks==0)
    'No Peaks'
end
%}
