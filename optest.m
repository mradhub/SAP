clf;
%options = optimset('Display','iter','PlotFcns',@optimplotfval,'MaxFunEvals',6400,'MaxIter',3200,'TolFun',1e-10);
options = optimset('Display', 'iter','MaxIter',6400);
low = [1e11,2,10,-5;1e11,2,10,-5];
up = [1e18,12,600,5;1e18,12,600,5];
init = [5e16,6,250,0;5e16,6,250,0];
init2 = [4.24E15,5,299,4;2.33E15,12,128,2];
anonfun2;
plot(DatCal(:,1),obsInt1)
hold on
plot(DatCal(:,1),obsInt2,'r-')
TicID = tic; 
[x,fval] = patternsearch(funct2,init,[],[],[],[],low,up,[],options); 
toc(TicID); 
x(1,1), x(1,2), x(1,3), x(1,4)
x(2,1), x(2,2), x(2,3), x(2,4)
fval