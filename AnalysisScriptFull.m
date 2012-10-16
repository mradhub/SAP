% AnalysisScriptFull.m
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

LI = -4;
Cat1 = importdata(molpath1);
QNCat1 = importdata(QNmolpath1);
[Mol1,QNMol1] = RenameandKill(Cat1,QNCat1,U,LI);
[MolCal1,QNMolCal1] = LimitData(Mol1,QNMol1,DatCal);
part1 = importdata(parpath1);
A1 = PartitionFunction(part1);
[AList1,AguList1,EUJ1] = EinsteinAFind(MolCal1,part1);

LI = -4;
Cat2 = importdata(molpath2);
QNCat2 = importdata(QNmolpath2);
[Mol2,QNMol2] = RenameandKill(Cat2,QNCat2,U,LI);
[MolCal2,QNMolCal2] = LimitData(Mol2,QNMol2,DatCal);
part2 = importdata(parpath2);
A2 = PartitionFunction(part2);
[AList2,AguList2,EUJ2] = EinsteinAFind(MolCal2,part2);

LI = -4;
Cat3 = importdata(molpath3);
QNCat3 = importdata(QNmolpath3);
[Mol3,QNMol3] = RenameandKill(Cat3,QNCat3,U,LI);
[MolCal3,QNMolCal3] = LimitData(Mol3,QNMol3,DatCal);
part3 = importdata(parpath3);
A3 = PartitionFunction(part3);
[AList3,AguList3,EUJ3] = EinsteinAFind(MolCal3,part3);

LI = -3;
Cat4 = importdata(molpath4);
QNCat4 = importdata(QNmolpath4);
[Mol4,QNMol4] = RenameandKill(Cat4,QNCat4,U,LI);
[MolCal4,QNMolCal4] = LimitData(Mol4,QNMol4,DatCal);
part4 = importdata(parpath4);
A4 = PartitionFunction(part4);
[AList4,AguList4,EUJ4] = EinsteinAFind(MolCal4,part4);

LI = -4;
Cat5 = importdata(molpath5);
QNCat5 = importdata(QNmolpath5);
[Mol5,QNMol5] = RenameandKill(Cat5,QNCat5,U,LI);
[MolCal5,QNMolCal5] = LimitData(Mol5,QNMol5,DatCal);
part5 = importdata(parpath5);
A5 = PartitionFunction(part5);
[AList5,AguList5,EUJ5] = EinsteinAFind(MolCal5,part5);

LI = -5;
Cat6 = importdata(molpath6);
QNCat6 = importdata(QNmolpath6);
[Mol6,QNMol6] = RenameandKill(Cat6,QNCat6,U,LI);
[MolCal6,QNMolCal6] = LimitData(Mol6,QNMol6,DatCal);
part6 = importdata(parpath6);
A6 = PartitionFunction(part6);
[AList6,AguList6,EUJ6] = EinsteinAFind(MolCal6,part6);

LI = -3.5;
Cat7 = importdata(molpath7);
QNCat7 = importdata(QNmolpath7);
[Mol7,QNMol7] = RenameandKill(Cat7,QNCat7,U,LI);
[MolCal7,QNMolCal7] = LimitData(Mol7,QNMol7,DatCal);
part7 = importdata(parpath7);
A7 = PartitionFunction(part7);
[AList7,AguList7,EUJ7] = EinsteinAFind(MolCal7,part7);

LI = -4;
Cat8 = importdata(molpath8);
QNCat8 = importdata(QNmolpath8);
[Mol8,QNMol8] = RenameandKill(Cat8,QNCat8,U,LI);
[MolCal8,QNMolCal8] = LimitData(Mol8,QNMol8,DatCal);
part8 = importdata(parpath8);
A8 = PartitionFunction(part8);
[AList8,AguList8,EUJ8] = EinsteinAFind(MolCal8,part8);

LI = -4;
Cat9 = importdata(molpath9);
QNCat9 = importdata(QNmolpath9);
[Mol9,QNMol9] = RenameandKill(Cat9,QNCat9,U,LI);
[MolCal9,QNMolCal9] = LimitData(Mol9,QNMol9,DatCal);
part9 = importdata(parpath9);
A9 = PartitionFunction(part9);
[AList9,AguList9,EUJ9] = EinsteinAFind(MolCal9,part9);

LI = -4;
Cat10 = importdata(molpath10);
QNCat10 = importdata(QNmolpath10);
[Mol10,QNMol10] = RenameandKill(Cat10,QNCat10,U,LI);
[MolCal10,QNMolCal10] = LimitData(Mol10,QNMol10,DatCal);
part10 = importdata(parpath10);
A10 = PartitionFunction(part10);
[AList10,AguList10,EUJ10] = EinsteinAFind(MolCal10,part10);

LI = -3;
Cat11 = importdata(molpath11);
QNCat11 = importdata(QNmolpath11);
[Mol11,QNMol11] = RenameandKill(Cat11,QNCat11,U,LI);
[MolCal11,QNMolCal11] = LimitData(Mol11,QNMol11,DatCal);
part11 = importdata(parpath11);
A11 = PartitionFunction(part11);
[AList11,AguList11,EUJ11] = EinsteinAFind(MolCal11,part11);

LI = -4;
Cat12 = importdata(molpath12);
QNCat12 = importdata(QNmolpath12);
[Mol12,QNMol12] = RenameandKill(Cat12,QNCat12,U,LI);
[MolCal12,QNMolCal12] = LimitData(Mol12,QNMol12,DatCal);
part12 = importdata(parpath12);
A12 = PartitionFunction(part12);
[AList12,AguList12,EUJ12] = EinsteinAFind(MolCal12,part12);
