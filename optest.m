clf;
options = psoptimset('Display', 'iter','MaxIter',80000,'MaxFunEvals',80000,'UseParallel','always','CompletePoll','on','TolMesh',1e-10,'TolX',1e-10,'TolFun',1e-10,'ScaleMesh','on');
%low, up and init are the imputs for the pattern search optimization
low = [1e11,1,10,-5;1e11,1,10,-5];
up = [1e18,12,600,5;1e18,12,600,5];
init = [5e16,6,250,0;5e16,6,250,0];
%a simulated spectrum is created with the parameters listed in init2
init2 = [5.05E15,1,470,3;6.44E14,7,463,1];
%anonfun2 runs the script to define the function to be optimized
anonfun2;
figure
subplot(2,2,1),plot(DatCal(:,1),obsInt1),title('Component 1')
subplot(2,2,2),plot(DatCal(:,1),obsInt2),title('Component 2')
subplot(2,2,3),plot(DatCal(:,1),obsInt1 + obsInt2),title('Total Spectrum')
subplot(2,2,4),plot(DatCal(:,1),obsInt1,'b-')
hold on, subplot(2,2,4),plot(DatCal(:,1),obsInt2,'r-')
subplot(2,2,4),plot(DatCal(:,1),obsInt1 + obsInt2,'g-')
subplot(2,2,4), title('Total Spectrum with Compnonents')
TicID = tic; 
[x,fval] = patternsearch(funct2,init,[],[],[],[],low,up,[],options); 
toc(TicID); 
x(1,1), x(1,2), x(1,3), x(1,4)
x(2,1), x(2,2), x(2,3), x(2,4)
fval
Fit1 = sim1(x);
Fit2 = sim2(x);
figure
subplot(2,2,1),plot(DatCal(:,1),Fit1),title('Fit Component 1')
subplot(2,2,2),plot(DatCal(:,1),Fit2),title('Fit Component 2')
subplot(2,2,3),plot(DatCal(:,1),Fit1 + Fit2),title('Total Fit')
subplot(2,2,4),plot(DatCal(:,1),Fit1 + Fit2,'r-'),title('Fit Comparison')
hold on,subplot(2,2,4),plot(DatCal(:,1),obsInt1+obsInt2,'b-')
plot(DatCal(:,1),Fit1)
hold on
plot(DatCal(:,1),Fit2,'r-')
plot(DatCal(:,1),Fit1+Fit2,'g-')