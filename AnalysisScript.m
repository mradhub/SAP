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

Cat3 = importdata(molpath3);
QNCat3 = importdata(QNmolpath3);
[Mol3,QNMol3] = RenameandKill(Cat3,QNCat3,U,LI);
[MolCal3,QNMolCal3] = LimitData(Mol3,QNMol3,DatCal);
part3 = importdata(parpath3);
A3 = PartitionFunction(part3);
[AList3,AguList3,EUJ3] = EinsteinAFind(MolCal3,part3);

Cat4 = importdata(molpath4);
QNCat4 = importdata(QNmolpath4);
[Mol4,QNMol4] = RenameandKill(Cat4,QNCat4,U,LI);
[MolCal4,QNMolCal4] = LimitData(Mol4,QNMol4,DatCal);
part4 = importdata(parpath4);
A4 = PartitionFunction(part4);
[AList4,AguList4,EUJ4] = EinsteinAFind(MolCal4,part4);

