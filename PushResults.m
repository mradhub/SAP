% function PushResults(IDPeaks,FitSim,totalSim,path,molecule)
% Input : IDPeaks - spectral lines identified as peaks by PeakMatch, array
%         FitSim - simulation results from LeastSquares, array
%         totalSim - simulated spectrum, array
%         path - path for data output, string
%         molecule - molecule from fit, string

function PushResults(IDPeaks,FitSim,totalSim,path,molecule)
xlswrite(strcat(path,'IDPeaks',molecule),IDPeaks)
xlswrite(strcat(path,'Parameters',molecule),FitSim)
xlswrite(strcat(path,'totalSim',molecule),totalSim)