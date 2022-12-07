function xout = normeq(A,b)

    R = A' * A;
    y = A' * b;
    xout = R \ y;

end

