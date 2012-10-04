clf;
options = psoptimset('Display', 'iter','MaxIter',80000,'MaxFunEvals',8000000,'UseParallel','always','CompletePoll','on','TolMesh',1e-11,'TolX',1e-11,'TolFun',1e-11,'ScaleMesh','on');
%low, up and init are the imputs for the pattern search optimization
low = [1e11,1,10,-5;1e11,1,10,-5;1e11,1,10,-5;1e11,1,10,-5];
up = [1e18,12,600,5;1e18,12,600,5;1e18,12,600,5;1e18,12,600,5];
init = [5e16,6,250,0;5e16,6,250,0;5e16,6,250,0;5e16,6,250,0];
%a simulated spectrum is created with the parameters listed in init2
init4 = [6.83E16,3,529,0;2.03E16,8,423,4;1.32E16,9,304,4;6.05E16,6,460,0];
%anonfun2 runs the script to define the function to be optimized
anonfun4;
%figure
%subplot(2,2,1),plot(DatCal(:,1),obsInt1),title('Component 1')
%subplot(2,2,2),plot(DatCal(:,1),obsInt2),title('Component 2')
%subplot(2,2,3),plot(DatCal(:,1),obsInt1 + obsInt2),title('Total Spectrum')
%subplot(2,2,4),plot(DatCal(:,1),obsInt1,'b-')
%hold on, subplot(2,2,4),plot(DatCal(:,1),obsInt2,'r-')
%subplot(2,2,4),plot(DatCal(:,1),obsInt1 + obsInt2,'g-')
%subplot(2,2,4), title('Total Spectrum with Compnonents')
TicID = tic; 
[x,fval] = patternsearch(funct4,init,[],[],[],[],low,up,[],options); 
toc(TicID); 
x(1,1), x(1,2), x(1,3), x(1,4)
x(2,1), x(2,2), x(2,3), x(2,4)
x(3,1), x(3,2), x(3,3), x(3,4)
x(4,1), x(4,2), x(4,3), x(4,4)
fval
Fit1 = sim1(x);
Fit2 = sim2(x);
%figure
%subplot(2,2,1),plot(DatCal(:,1),Fit1),title('Fit Component 1')
%subplot(2,2,2),plot(DatCal(:,1),Fit2),title('Fit Component 2')
%subplot(2,2,3),plot(DatCal(:,1),Fit1 + Fit2),title('Total Fit')
%subplot(2,2,4),plot(DatCal(:,1),Fit1 + Fit2,'r-'),title('Fit Comparison')
%hold on,subplot(2,2,4),plot(DatCal(:,1),obsInt1+obsInt2,'b-')
%plot(DatCal(:,1),Fit1)
%hold on
%plot(DatCal(:,1),Fit2,'r-')
%plot(DatCal(:,1),Fit1+Fit2,'g-')