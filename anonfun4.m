%anonfun4.m
%script to define anonymous function to be optimized
molFreq = MolCal1(:,1);
obsFreq = DatCal(:,1);
AguList = AguList1;
A = A1;
EUJ = EUJ1;
sim1 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(1,1),init(1,2),init(1,3),init(1,4));

molFreq = MolCal2(:,1);
obsFreq = DatCal(:,1);
AguList = AguList2;
A = A2;
EUJ = EUJ2;
sim2 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(2,1),init(2,2),init(2,3),init(2,4));

molFreq = MolCal3(:,1);
obsFreq = DatCal(:,1);
AguList = AguList3;
A = A3;
EUJ = EUJ3;
sim3 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(3,1),init(3,2),init(3,3),init(3,4));

molFreq = MolCal4(:,1);
obsFreq = DatCal(:,1);
AguList = AguList4;
A = A4;
EUJ = EUJ4;
sim4 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(4,1),init(4,2),init(4,3),init(4,4));


obsInt1 = sim1(init4); 
obsInt2 = sim2(init4);
obsInt3 = sim3(init4);
obsInt4 = sim4(init4);
obsInt = obsInt1 + obsInt2 + obsInt3 + obsInt4;

sim = @(init) sim1(init) + sim2(init) + sim3(init) + sim4(init);

funct4 = @(init) norm(sim(init)-obsInt);
