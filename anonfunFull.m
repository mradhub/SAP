%anonfunFull.m
%script to define anonymous function to be optimized

obsFreq = DatCal(:,1);

molFreq = MolCal1(:,1);
AguList = AguList1;
A = A1;
EUJ = EUJ1;
sim1 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(1,1),init(1,2),init(1,3),init(1,4));

molFreq = MolCal2(:,1);
AguList = AguList2;
A = A2;
EUJ = EUJ2;
sim2 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(2,1),init(2,2),init(2,3),init(2,4));

molFreq = MolCal3(:,1);
AguList = AguList3;
A = A3;
EUJ = EUJ3;
sim3 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(3,1),init(3,2),init(3,3),init(3,4));

molFreq = MolCal4(:,1);
AguList = AguList4;
A = A4;
EUJ = EUJ4;
sim4 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(4,1),init(4,2),init(4,3),init(4,4));

molFreq = MolCal5(:,1);
AguList = AguList5;
A = A5;
EUJ = EUJ5;
sim5 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(5,1),init(5,2),init(5,3),init(5,4));

molFreq = MolCal6(:,1);
AguList = AguList6;
A = A6;
EUJ = EUJ6;
sim6 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(6,1),init(6,2),init(6,3),init(6,4));

molFreq = MolCal7(:,1);
AguList = AguList7;
A = A7;
EUJ = EUJ7;
sim7 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(7,1),init(7,2),init(7,3),init(7,4));

molFreq = MolCal8(:,1);
AguList = AguList8;
A = A8;
EUJ = EUJ8;
sim8 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(8,1),init(8,2),init(8,3),init(8,4));

molFreq = MolCal9(:,1);
AguList = AguList9;
A = A9;
EUJ = EUJ9;
sim9 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(9,1),init(9,2),init(9,3),init(9,4));

molFreq = MolCal10(:,1);
AguList = AguList10;
A = A10;
EUJ = EUJ10;
sim10 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(10,1),init(10,2),init(10,3),init(10,4));

molFreq = MolCal11(:,1);
AguList = AguList11;
A = A11;
EUJ = EUJ11;
sim11 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(11,1),init(11,2),init(11,3),init(11,4));


molFreq = MolCal12(:,1);
AguList = AguList12;
A = A12;
EUJ = EUJ12;
sim12 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(12,1),init(12,2),init(12,3),init(12,4));


%{
obsInt1 = sim1(initFull); 
obsInt2 = sim2(initFull);
obsInt3 = sim3(initFull); 
obsInt4 = sim4(initFull);
obsInt5 = sim5(initFull); 
obsInt6 = sim6(initFull);
obsInt7 = sim7(initFull); 
obsInt8 = sim8(initFull);
%}

obsInt = DatCal(:,end);

sim = @(init) sim1(init) + sim2(init) + sim3(init) + sim4(init) + sim5(init) + sim6(init) + sim7(init) + sim8(init) + sim9(init) + sim10(init) + sim11(init) + sim12(init);

functFull = @(init) norm(sim(init)-obsInt);