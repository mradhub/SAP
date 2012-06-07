%Function Dat1 = SpectrumCalibrate(Dat,AppEff,Source,Beam)
%Input:  Dat - x2 double of observational data
%        AppEff - doubel apperture efficiency of the telescope
%        Source - double source size in arcsec, enter as 0 if unknown
%        Beam - beam size in arcsec, enter as 0 if unknown
%Output: Dat1 - x3 double of raw observational data and data calibrated to
%               Tmb (main beam temperature)

function Dat1 = SpectrumCalibrate(Dat,AppEff,Source,Beam)
Dat1= Dat;
Dat1(:,3) = Dat(:,2)/AppEff;
if(Source~=0)
    B = Source^2/(Source^2+Beam^2);
    Dat1(:,4) = Dat1(:,3)*B;
    global wavelength 
    wavelength = length(Dat);
end
