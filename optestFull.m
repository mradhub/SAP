%clf;
options = psoptimset('Display', 'iter','MaxIter',9E10,'MaxFunEvals',9E10,'UseParallel','always','CompletePoll','on','TolMesh',1e-11,'TolX',1e-11,'TolFun',1e-11,'ScaleMesh','on');
%low, up and init are the imputs for the pattern search optimization
low = [1e11,1,10,-5;1e11,1,10,-5;1e11,1,10,-5;1e11,1,10,-5;1e11,1,10,-5];
up = [1e18,12,600,5;1e18,12,600,5;1e18,12,600,5;1e18,12,600,5;1e18,12,600,5];
init = [1.2890e+17,12,600,-4.0465;
    2.9298e+16,5.3777,134.8014,-3.9685;
    4.9245e+16,10.1264,500.1252,1.9399;
    6.4566e+15,10.4187,222.3864,-1.0463;
    5.00E16,6,250,0];
%a simulated spectrum is created with the parameters listed in init2
initFull = [7.19E16,11,398,-4;
    2.37E16,5,115,-4;
    4.22E16,10,441,2;
    6.09E15,10,222,-1;
    2.57E16,4,91,4;
    4.23E16,5,128,0;
    3.39E15,8,336,2;
    1.41E16,11,226,3];
%anonfunFull runs the script to define the function to be optimized
anonfunFull;

TicID = tic; 
[x,fval] = patternsearch(functFull,init,[],[],[],[],low,up,[],options); 
toc(TicID);

x(1,1), x(1,2), x(1,3), x(1,4)
x(2,1), x(2,2), x(2,3), x(2,4)
x(3,1), x(3,2), x(3,3), x(3,4)
x(4,1), x(4,2), x(4,3), x(4,4)
x(5,1), x(5,2), x(5,3), x(5,4)

fval

Fit1 = sim1(x);
Fit2 = sim2(x);
Fit3 = sim3(x);
Fit4 = sim4(x);
Fit5 = sim5(x);