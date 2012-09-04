%anonfun.m
%script to define anonymous function to be optimized
molFreq = MolCal2(:,1);
obsFreq = DatCal(:,1);
AguList = AguList2;
A = A2;
EUJ = EUJ2;

sim1 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(1,1),init(1,2),init(1,3),init(1,4));


%{
molFreq = MolCal1(:,1);
AguList = AguList1;
A = A1;
EUJ = EUJ1;
sim2 = @(init) totalSim(molFreq,obsFreq,AguList,A,EUJ,init(2,1),init(2,2),init(2,3),init(2,4));

sim = @(init) sim1(init)+sim2(init);
%}

obsInt = sim1(init2(1,:));

sim = @(init) sim1(init);

funct = @(init) norm(sim(init)-obsInt);


%{
f1 = @(init) optfun(init(1,:),molFreq,obsFreq,obsInt,AguList,A,EUJ);
molFreq = MolCal2(:,1);
AguList = AguList2;
A = A2;
EUJ = EUJ2;
f2 = @(init) optfun(init(2,:),molFreq,obsFreq,obsInt,AguList,A,EUJ);
funct = @(init) optfun(init,molFreq,obsFreq,obsInt,AguList,A,EUJ);
%}