function GoldenOutput = GoldenLeastSquares2(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
%function GoldenOutput = GoldenLeastSquares2(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
%(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU)
% Input: NTL - column density lower limit (cm^-2)
%        NTU - column density upper limit (cm^-2)
%        FWHML - full width half max lower limit (km/s)
%        FWHMU - full width half max upper limit (km/s)
%        tempL - temperature lower limit (K)
%        tempU - temperature upper limit (K)
%        shiftL - shift lower limit (MHz)
%        shiftU - shift upper limit (MHz)
%        molFreq - molecule frequency list from catalog file
%        obsFreq - observational frequency data
%        obsInt - observational intensity data
%        AguList - Einstein A times upper state degeneracy for transitions
%        A - coefficient of partition function fit
%        EUJ - upper state energy in joules
% Output:GoldenOutput = [NTM,NTSig,TempM,TempSig,shiftM,shiftSig,FWHMM,FWHMSig];
% Fit order: NT, Temp, shift, FWHM, NT, FWHM, Temp
% Minimizes function  of sum of squares of errors using a golden section
% search

r = .0382;
iteration = 1;

%NT1 first column density fit
NTFit = 1;
NTSig = 1;
NTa = NTL;
NTb = NTU;
Temp = mean([tempL,tempU]);
FWHM = mean([FWHML,FWHMU]);
Shift = mean([shiftL,shiftU]);
while(abs(NTSig/NTFit)>.01) %stops iteration when difference between previous fit and new fit is less than 1%
   NTc = NTa + r*(NTb-NTa);
   NTd = NTb - r*(NTb-NTa);
      
   %point c NT calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NTc,FWHM,Temp,Shift); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d NT calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NTd,FWHM,Temp,Shift); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       NTb = NTd;       
   else
       NTa = NTc;       
   end
   
   NTFit = mean([NTa,NTb])
   NTSig = NTb-NTa;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%Temp1 first temperature fit
TempFit = 1;
TempSig = 1;
Tempa = tempL;
Tempb = tempU;
iteration = 1;
NT = NTFit;
FWHM = mean([FWHML,FWHMU]);
Shift = mean([shiftL,shiftU]);
while(abs(TempSig/TempFit)>.0001) %stops iteration when difference between previous fit and new fit is less than .01%
   Tempc = Tempa + r*(Tempb-Tempa);
   Tempd = Tempb - r*(Tempb-Tempa);
     
   %point c Temp calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Tempc,Shift); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d Temp calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Tempd,Shift); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       Tempb = Tempd;
   else
       Tempa = Tempc;
   end
   
   TempFit = mean([Tempa,Tempb])
   TempSig = Tempb-Tempa;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%Shift1 first shift fit
ShiftFit = 1;
ShiftSig = 1;
Shifta = shiftL;
Shiftb = shiftU;
iteration = 1;
NT = NTFit;
Temp = TempFit;
FWHM = mean([FWHML,FWHMU]);
while(abs(ShiftSig/ShiftFit)>.1) %stops iteration when difference between previous fit and new fit is less than 10%
   Shiftc = Shifta + r*(Shiftb-Shifta);
   Shiftd = Shiftb - r*(Shiftb-Shifta);
      
   %point c Shift calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shiftc); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d Shift calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shiftd); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       Shiftb = Shiftd;
   else
       Shifta = Shiftc;
   end
   
   ShiftFit = mean([Shifta,Shiftb])
   ShiftSig = Shiftb-Shifta;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%FWHM1 first FWHM fit
FWHMFit = 1;
FWHMSig = 1;
FWHMa = FWHML;
FWHMb = FWHMU;
iteration = 1;
NT = NTFit;
Temp = TempFit;
Shift = ShiftFit;
while(abs(FWHMSig/FWHMFit)>.05) %stops iteration when difference between previous fit and new fit is less than 5%
   FWHMc = FWHMa + r*(FWHMb-FWHMa);
   FWHMd = FWHMb - r*(FWHMb-FWHMa);
      
   %point c FWHM calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHMc,Temp,Shift); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d FWHM calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHMd,Temp,Shift); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       FWHMb = FWHMd;
   else
       FWHMa = FWHMc;
   end
   
   FWHMFit = mean([FWHMa,FWHMb])
   FWHMSig = FWHMb-FWHMa;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%NT2 second column density fit
NTa = NTFit-NTFit*.5;
NTb = NTFit+NTFit*.5;
NTFit = 1;
NTSig = 1;
Temp = TempFit;
FWHM = FWHMFit;
Shift = ShiftFit;
while(abs(NTSig/NTFit)>.01) %stops iteration when difference between previous fit and new fit is less than 1%
   NTc = NTa + r*(NTb-NTa);
   NTd = NTb - r*(NTb-NTa);
      
   %point c NT calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NTc,FWHM,Temp,Shift); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d NT calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NTd,FWHM,Temp,Shift); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       NTb = NTd;       
   else
       NTa = NTc;       
   end
   
   NTFit = mean([NTa,NTb])
   NTSig = NTb-NTa;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%Temp2 second temperature fit
Tempa = TempFit-TempFit*.4;
Tempb = TempFit+TempFit*.4;
TempFit = 1;
TempSig = 1;
iteration = 1;
NT = NTFit;
FWHM = FWHMFit;
Shift = ShiftFit;
while(abs(TempSig/TempFit)>.0001) %stops iteration when difference between previous fit and new fit is less than .01%
   Tempc = Tempa + r*(Tempb-Tempa);
   Tempd = Tempb - r*(Tempb-Tempa);
     
   %point c Temp calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Tempc,Shift); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d Temp calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Tempd,Shift); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       Tempb = Tempd;
   else
       Tempa = Tempc;
   end
   
   TempFit = mean([Tempa,Tempb])
   TempSig = Tempb-Tempa;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%Shift2 second shift fit
Shifta = ShiftFit-abs(ShiftFit)*.2;
Shiftb = ShiftFit+abs(ShiftFit)*.2;
ShiftFit = 1;
ShiftSig = 1;
iteration = 1;
NT = NTFit;
Temp = TempFit;
FWHM = FWHMFit;
while(abs(ShiftSig/ShiftFit)>.1) %stops iteration when difference between previous fit and new fit is less than 10%
   Shiftc = Shifta + r*(Shiftb-Shifta);
   Shiftd = Shiftb - r*(Shiftb-Shifta);
      
   %point c Shift calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shiftc); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d Shift calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHM,Temp,Shiftd); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       Shiftb = Shiftd;
   else
       Shifta = Shiftc;
   end
   
   ShiftFit = mean([Shifta,Shiftb])
   ShiftSig = Shiftb-Shifta;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

%FWHM2 second FWHM fit
FWHMa = FWHMFit-FWHMFit*.3;
FWHMb = FWHMFit+FWHMFit*.3;
FWHMFit = 1;
FWHMSig = 1;
iteration = 1;
NT = NTFit;
Temp = TempFit;
Shift = ShiftFit;
while(abs(FWHMSig/FWHMFit)>.05) %stops iteration when difference between previous fit and new fit is less than 5%
   FWHMc = FWHMa + r*(FWHMb-FWHMa);
   FWHMd = FWHMb - r*(FWHMb-FWHMa);
      
   %point c FWHM calculation
   fc = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHMc,Temp,Shift); %creats simulation at point c
   chic = sum((fc-obsInt).^2); %measures sum of squares of errors for point c
   
   %point d FWHM calculation
   fd = totalSim(molFreq,obsFreq,AguList,A,EUJ,NT,FWHMd,Temp,Shift); %creats simulation at point d
   chid = sum((fd-obsInt).^2); %measures sum of squares of errors for point d
   
   if(chic<=chid)
       FWHMb = FWHMd;
   else
       FWHMa = FWHMc;
   end
   
   FWHMFit = mean([FWHMa,FWHMb])
   FWHMSig = FWHMb-FWHMa;
   iteration = iteration +1;
   %if(iteration>200)
   %    break
   %end
end

final =  totalSim(molFreq,obsFreq,AguList,A,EUJ,NTFit,FWHMFit,TempFit,ShiftFit);
chifinal = sum((final-obsInt).^2);

GoldenOutput = [NTFit,NTSig,TempFit,TempSig,ShiftFit,ShiftSig,FWHMFit,FWHMSig,chifinal];