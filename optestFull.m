clf;
options = psoptimset('Display', 'iter','MaxIter',9E10,'MaxFunEvals',9E10,'UseParallel','always','TolMesh',1e-8,'TolX',1e-8,'TolFun',1e-8,'ScaleMesh','on');
%low, up and init are the imputs for the pattern search optimization
low = [1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5;
    1e11,1,10,-5];
up = [1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5;
    1e18,12,600,5];
init = [5.00E16,6,250,0;5.00E16,6,250,0;5.00E16,6,250,0;5.00E16,6,250,0;5.00E16,6,250,0;5.00E16,6,250,0;5.00E16,6,250,0;5.00E16,6,250,0];
%a simulated spectrum is created with the parameters listed in init2
initFull = [2.95E15,8,240,-4;
    8.98E16,11,458,2;
    2.65E16,3,329,0;
    3.02E16,7,88,-3;
    2.04E16,3,415,1;
    6.60E16,5,325,3;
    4.24E16,6,495,2;
    5.30E16,7,252,-4];
%anonfunFull runs the script to define the function to be optimized
anonfunFull;

TicID = tic; 
[x,fval] = patternsearch(functFull,newinit,[],[],[],[],low,up,[],options); 
toc(TicID);

x(1,1), x(1,2), x(1,3), x(1,4)
x(2,1), x(2,2), x(2,3), x(2,4)
x(3,1), x(3,2), x(3,3), x(3,4)
x(4,1), x(4,2), x(4,3), x(4,4)
x(5,1), x(5,2), x(5,3), x(5,4)
x(6,1), x(6,2), x(6,3), x(6,4)
x(7,1), x(7,2), x(7,3), x(7,4)
x(8,1), x(8,2), x(8,3), x(8,4)
x(9,1), x(9,2), x(9,3), x(9,4)
x(10,1), x(10,2), x(10,3), x(10,4)
x(11,1), x(11,2), x(11,3), x(11,4)
x(12,1), x(12,2), x(12,3), x(12,4)

fval

Fit1 = sim1(x);
Fit2 = sim2(x);
Fit3 = sim3(x);
Fit4 = sim4(x);
Fit5 = sim5(x);
Fit6 = sim6(x);
Fit7 = sim7(x);
Fit8 = sim8(x);
Fit9 = sim9(x);
Fit10 = sim10(x);
Fit11 = sim11(x);
Fit12 = sim12(x);












