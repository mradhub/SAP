clf;
options = psoptimset('Display', 'iter','MaxIter',8000000,'MaxFunEvals',8000000,'UseParallel','always','CompletePoll','on','TolMesh',1e-10,'TolX',1e-10,'TolFun',1e-10,'ScaleMesh','on');
%low, up and init are the imputs for the pattern search optimization
low = [1e11,1,10,-5;1e11,1,10,-5];
up = [1e18,12,600,5;1e18,12,600,5];
init = [5.00E16,2,250,0;5.00E16,6,250,0];
%a simulated spectrum is created with the parameters listed in init2
init2 = [8.55E16,10,100,3;5.47E15,11,293,-4];
%anonfun2 runs the script to define the function to be optimized
anonfun2;
%figure
subplot(3,1,1),plot(DatCal(:,1),obsInt1),title('Component 1')
subplot(3,1,2),plot(DatCal(:,1),obsInt2),title('Component 2')
subplot(3,1,3),plot(DatCal(:,1),obsInt1 + obsInt2),title('Total Spectrum')

TicID = tic; 
[x,fval] = patternsearch(funct2,init,[],[],[],[],low,up,[],options); 
toc(TicID); 
x(1,1), x(1,2), x(1,3), x(1,4)
x(2,1), x(2,2), x(2,3), x(2,4)
fval
Fit1 = sim1(x);
Fit2 = sim2(x);
figure
subplot(3,2,1),plot(DatCal(:,1),obsInt1),title('Sim Component 1')
subplot(3,2,2),plot(DatCal(:,1),Fit1),title('Fit Component 1')
subplot(3,2,3),plot(DatCal(:,1),obsInt2),title('Sim Component 2')
subplot(3,2,4),plot(DatCal(:,1),Fit2),title('Fit Component 2')
subplot(3,2,5),plot(DatCal(:,1),obsInt1+obsInt2),title('Total Sim')
subplot(3,2,6),plot(DatCal(:,1),Fit1+Fit2),title('Total Fit')

figure
subplot(3,1,1),plot(DatCal(:,1),obsInt1 + obsInt2),title('Total Sim')
subplot(3,1,2),plot(DatCal(:,1),Fit1 + Fit2),title('Total Fit')
subplot(3,1,3),plot(DatCal(:,1),obsInt1 + obsInt2 - Fit1 - Fit2),title('Difference Spectrum')
