function GoldenOutput = GoldenLeastSquares(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
%function GoldenOutput = GoldenLeastSquares(NTL,NTU,FWHML,FWHMU,tempL,tempU,shiftL,shiftU,molFreq,obsFreq,obsInt,AguList,A,EUJ)
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
while(abs(NTSig/NTFit)>.01) %stops iteration when difference between previous fit and new fit is less than 1%
   Temp = mean([tempL,tempU]);
   FWHM = mean([FWHML,FWHMU]);
   Shift = mean([shiftL,shiftU]);
   NTc = NTa + r*(NTb-NTa);
   NTd = NTb - r*(NTb-NTa);
   NTfitm1 = mean([NTa,NTb]);
      
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
while(abs(TempSig/TempFit)>.0001) %stops iteration when difference between previous fit and new fit is less than .01%
   NT = NTFit;
   Shift = mean([shiftL,shiftU]);
   Tempc = Tempa + r*(Tempb-Tempa);
   Tempd = Tempb - r*(Tempb-Tempa);
   Tempfitm1 = mean([Tempa,Tempb]);
      
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

GoldenOutput = [NTFit,NTSig,TempFit,TempSig];