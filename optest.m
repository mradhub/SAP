clf;
%options = optimset('Display','iter','PlotFcns',@optimplotfval,'MaxFunEvals',6400,'MaxIter',3200,'TolFun',1e-10);
options = psoptimset('Display', 'iter','MaxIter',80000,'MaxFunEvals',80000,'UseParallel','always','CompletePoll','on','TolMesh',1e-10,'TolX',1e-10,'TolFun',1e-10,'Vectorized','on');
low = [1e11,1,10,-5;1e11,1,10,-5];
up = [1e18,12,600,5;1e18,12,600,5];
init = [5e16,6,250,0;5e16,6,250,0];
init2 = [8.34E15,6,451,4;7.77E15,1,423,-5];
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