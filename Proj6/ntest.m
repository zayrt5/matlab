function b = ntest(functionmatrix ,xi)
    syms x1 x2;
    fs = struct('f1',functionmatrix(1,1), 'f2', functionmatrix(2,1));
    pb = subs(fs, [x1,x2], [xi(1),xi(2)]);
    disp(pb.f1 + pb.f2);
    b(1,1) = pb.f1;
    b(2,1) = pb.f2;
end

