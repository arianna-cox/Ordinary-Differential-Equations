function [A,B,PS,G_PS] = FalsePosition(g,a,b,epsilon)

A = [a];
B = [b];
g_a = g(a);
g_b = g(b);
PS = [(g_b*a - g_a*b)/(g_b - g_a)];
G_PS = [g(PS(1))];
n=2;

while abs(G_PS(n-1)) >= epsilon
    if g_a*G_PS(n-1) < 0
        B(n) = PS(n-1);
        A(n) = A(n-1);
    else
        A(n) = PS(n-1);
        B(n) = B(n-1);
    end
    g_a = g(A(n));
    g_b = g(B(n));
    PS(n) = (g_b*A(n) - g_a*B(n))/(g_b - g_a);
    G_PS(n) = g(PS(n));
    n = n+1;
end

A=A.';
B=B.';
PS=PS.';
G_PS = G_PS.';
end

