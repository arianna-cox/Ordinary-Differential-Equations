function y = G(p,a)
    n= 1000;
    h = 1/n;
    [X,Y] = RK4vector(@(x,Y) [Y(2), -p^2 * (1+x)^(-a) * Y(1)],0,[0,1],1,h);
    y = Y(n+1);
end