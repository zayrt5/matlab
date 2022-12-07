function xout = thinqr(A,b)

    [Q,R] = qr(A,0);
    btld = Q' * b;
    xout = R \ btld;

end

 