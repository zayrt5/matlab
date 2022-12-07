function J = createJ(M,xi)
    syms x1 x2;
    pj = jacobian(M, [x1,x2]);
    %disp(pj);
    J(1,1) = subs(pj(1,1), x1, xi(1));
    J(1,2) = subs(pj(1,2), x2, xi(2));
    J(2,1) = subs(pj(2,1), x1, xi(1));
    J(2,2) = subs(pj(2,2), x2, xi(2));

end

