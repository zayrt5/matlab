function b = evalf(M, xi)
%EVALF Summary of this function goes here
%   Detailed explanation goes here
    syms x1 x2;
    %disp(M);
    fs = struct('f1',M(1,1), 'f2', M(2,1));
    pb = subs(fs, [x1,x2], [xi(1),xi(2)]);
    b(1,1) = pb.f1;
    b(2,1) = pb.f2;
end

