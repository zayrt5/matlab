function y = thetaexp(theta,x)
%THETAEXP Summary of this function goes here
%   Detailed explanation goes here
    y = 1 / (1+ exp(-theta * x));
end

