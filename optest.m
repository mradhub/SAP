clf;
%options = optimset('Display','iter','PlotFcns',@optimplotfval,'MaxFunEvals',6400,'MaxIter',3200,'TolFun',1e-10);
options = psoptimset('Display', 'iter','MaxIter',80000,'MaxFunEvals',80000,'UseParallel','always','CompletePoll','on','TolMesh',1e-11,'TolX',1e-11,'TolFun',1e-11,'PlotFcns',@psplotbestf);
low = [1e11,1,10,-5;1e11,1,10,-5];
up = [1e18,12,600,5;1e18,12,600,5];
init = [5e16,6,250,0;5e16,6,250,0];
init2 = [7.81E16,11,128,1;4.00E16,4,371,0];
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