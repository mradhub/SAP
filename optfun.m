function f = optfun(init,molFreq,obsFreq,obsInt,AguList,A,EUJ)
%function f = optfun(init,molFreq,obsFreq,obsInt,AguList,A,EUJ)
% Input: init - array in the form [NT,FWHM,temp,shift] which holds the
%        values of the physical parameters
%        molFreq - molFreq - molecule frequency list from catalog file
%        obsFreq - observational frequency data
%        obsInt - observational intensity data
%        AguList - Einstein A times upper state degeneracy for transitions
%        A - coefficient of partition function fit
%        EUJ - upper state energy in joules
% Output:f - goodness of fit value of the simulation at init
% f = norm(totalsim(...)-obsInt)

nummols = length(molFreq(1,:));
i = 1;
sim = zeros(size(obsInt));
while(i<=nummols)
    sim = sim + totalSim(molFreq(:,i),obsFreq(:,i),AguList(:,i),A(i),EUJ(:,i),init(i,1),init(i,2),init(i,3),init(i,4));
end

f = norm(sim-obsInt);