% function Int = LogInt(logten)
% Input : logten = log_10 intensity from catalogdata
% Output: Int = Intensity of transition converted from log_10

function Int = LogInt(logten)
Int = 10.^(logten);