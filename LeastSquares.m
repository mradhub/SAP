%function FitSim = LeastSquares
%(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU)
% Input: NTL - column density lower limit (cm^-2)
%        NTU - column density upper limit (cm^-2)
%        FWHML - full width half max lower limit (km/s)
%        FWHMU - full width half max upper limit (km/s)
%        tempL - temperature lower limit (K)
%        tempU - temperature upper limit (K)
%        shiftL - shift lower limit (km/s)
%        shiftU - shift upper limit (km/s)

function FitSim = LeastSquares(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
NTM1 = mean([NTL,NTU]);
TempM1 = mean([tempL,tempU]);
shiftM1 = mean([shiftL,shiftU]);
FWHMM1 = mean([FWHML,FWHMU]);

StartFit = totalSim(molFreq,obsFreq,AguList,A,EUJ,NTM1,FWHMM1,TempM1,shiftM1);

%NT1 first column density fit
%FitOn = 'NT'
NTL2 = NTL;
NTU2 = NTU;
iteration = 0;
NTFitm1 = 1;
NTSig = 1;
while(abs((NTSig)/NTFitm1)>.01)%stops iteration when difference between previous fit and new fit is less than 1%
    Temp = mean([tempL,tempU]);
    FWHM = mean([FWHML,FWHMU]);
    Shift = mean([shiftL,shiftU]);
    
    %lower limit NT calculation
    NT = NTL;
    FitL = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using minimum NT and midpoints for all other parameters
    chiL = sum((FitL-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    %upper limit NT caluclation
    NT = NTU;
    FitU = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using maximum NT and midpoints for all other parameters
    chiU = sum((FitU-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    NTM = mean([NTL,NTU]);
    NTMFit1 = mean([NTL,NTU]);
    
    if(chiL<chiU)
        chiNT = chiL; %sets chiNT, the chi^2 of the overall fit to the chi^2 of the minimum NT simulation
        NTL = NTL; %keeps the lower limit NT the same
        NTU = NTM; %makes the new upper limit NT the old midpoint
    else
        chiNT = chiU; %sets chiNT, the chi^2 if the overall fit to the chi^2 of the maximum NT simulaiton
        NTL = NTM; %makes the new lower limit NT the old midpoint
        NTU = NTU; %keeps the upper NT limit the same
    end
    
    NTM = mean([NTL,NTU]);
    
    NTSig = abs(NTM-NTMFit1);
    iteration = iteration + 1;
    
end


%First Temperature fit
%FitOn = 'Temperature'
tempL2 = tempL;
tempU2 = tempU;
TempFit1 = 1;
TempSig = 1;
while(abs((TempSig)/TempFit1)>.0001)%stops iteration when difference between previous fit and new fit is less than .001%
    NT = NTM;
    Shift = mean([shiftL,shiftU]);
    FWHM = mean([FWHML,FWHMU]);
    
    %lower limit Temp calculation
    Temp = tempL;
    FitL = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using minimum Temp and midpoints for all other parameters
    chiL = sum((FitL-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    %upper limit Temp caluclation
    Temp = tempU;
    FitU = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using maximum Temp and midpoints for all other parameters
    chiU = sum((FitU-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    TempM = mean([tempL,tempU]);
    TempFit1 = mean([tempL,tempU]);
    
    if(chiL<chiU)
        chiTemp = chiL; %sets chiTemp, the chi^2 of the overall fit to the chi^2 of the minimum Temp simulation
        tempL = tempL; %keeps the lower limit Temp the same
        tempU = TempM; %makes the new upper limit Temp the old midpoint
    else
        chiTemp = chiU; %sets chiTemp, the chi^2 if the overall fit to the chi^2 of the maximum Temp simulaiton
        tempL = TempM; %makes the new lower limit Temp the old midpoint
        tempU = tempU; %keeps the upper Temp limit the same
    end
    
    TempM = mean([tempL,tempU]);
        
    TempSig = abs(TempM-TempFit1);
    iteration = iteration + 1;
    
end

%First Shift fit
%FitOn = 'Shift'
shiftL2 = shiftL;
shiftU2 = shiftU;
shiftFit1 = 1;
shiftSig = 1;
while(abs((shiftSig)/shiftFit1)>.1)%stops iteration when difference between previous fit and new fit is less than 10%
    NT = NTM;
    Temp = TempM;
    FWHM = mean([FWHML,FWHMU]);
    
    %lower limit shift calculation
    Shift = shiftL;
    FitL = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using minimum shift and midpoints for all other parameters
    chiL = sum((FitL-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    %upper limit shift caluclation
    Shift = shiftU;
    FitU = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using maximum shift and midpoints for all other parameters
    chiU = sum((FitU-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    shiftM = mean([shiftL,shiftU]);
    shiftFit1 = mean([shiftL,shiftU]);
    
    if(chiL<chiU)
        chiShift = chiL; %sets chiShift, the chi^2 of the overall fit to the chi^2 of the minimum shift simulation
        shiftL = shiftL; %keeps the lower limit shift the same
        shiftU = shiftM; %makes the new upper limit shift the old midpoint
    else
        chiShift = chiU; %sets chiShift, the chi^2 if the overall fit to the chi^2 of the maximum shift simulaiton
        shiftL = shiftM; %makes the new lower limit shift the old midpoint
        shiftU = shiftU; %keeps the upper shift limit the same
    end
    
    shiftM = mean([shiftL,shiftU]);
        
    shiftSig = abs(shiftM-shiftFit1);
    iteration = iteration + 1;
    
end

%First FWHM fit
%FitOn = 'FWHM'
FWHML2 = FWHML;
FWHMU2 = FWHMU;
FWHMFit1 = 1;
FWHMSig = 1;
while(abs((FWHMSig)/FWHMFit1)>.05)%stops iteration when difference between previous fit and new fit is less than .5%
    NT = NTM;
    Temp = TempM;
    Shift = shiftM;
    
    %lower limit FWHM calculation
    FWHM = FWHML;
    FitL = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using minimum FWHM and midpoints for all other parameters
    chiL = sum((FitL-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    %upper limit FWHM caluclation
    FWHM = FWHMU;
    FitU = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shift);%makes spectrum using maximum FWHM and midpoints for all other parameters
    chiU = sum((FitU-obsInt).^2)/length(obsFreq); %this is an approximation of the chi^2 of the simulation
    
    FWHMM = mean([FWHML,FWHMU]);
    FWHMFit1 = mean([FWHML,FWHMU]);
    
    if(chiL<chiU)
        chiFWHM = chiL; %sets chiFWGN, the chi^2 of the overall fit to the chi^2 of the minimum FWHM simulation
        FWHML = FWHML; %keeps the lower limit FWHM the same
        FWHMU = FWHMM; %makes the new upper limit FWHM the old midpoint
    else
        chiFWHM = chiU; %sets chiFWHM, the chi^2 if the overall fit to the chi^2 of the maximum FWHM simulaiton
        FWHML = FWHMM; %makes the new lower limit FWHM the old midpoint
        FWHMU = FWHMU; %keeps the upper FWHM limit the same
    end
    
    FWHMM = mean([FWHML,FWHMU]);
        
    FWHMSig = abs(FWHMM-FWHMFit1);
    iteration = iteration + 1;
    
end

EndFit = totalSim(molFreq,obsFreq,AguList,A,EUJ,NTM,FWHMM,TempM,shiftM);
plot(obsFreq,obsInt,'r-')
hold on
plot(obsFreq,EndFit,'b-')
%hold on
%plot(molFreq,maxTemp,'go')
chiStart = sum((StartFit-obsInt).^2)/length(obsFreq)
chiFit = sum((EndFit-obsInt).^2)/length(obsFreq)

FitSim = [NTM,NTSig,TempM,TempSig,shiftM,shiftSig,FWHMM,FWHMSig];

    