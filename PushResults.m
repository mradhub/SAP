% function PushResults(IDPeaks,FitSim,totalSim,path,molecule)
% Input : IDPeaks - spectral lines identified as peaks by PeakMatch, array
%         FitSim - simulation results from LeastSquares, array
%         totalSim - simulated spectrum, array
%         path - path for data output, string
%         molecule - molecule from fit, string

function PushResults(IDPeaks,FitSim,totalSim,path,molecule)

xlswrite(strcat(path,molecule,'IDPeaks'),IDPeaks)
xlswrite(strcat(path,molecule,'Parameters'),FitSim)
xlswrite(strcat(path,molecule,'totalSim'),totalSim)

