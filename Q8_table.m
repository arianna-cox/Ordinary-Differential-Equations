clc
clear
format longE

%Question 8
a = 4;
n = 2^9
h = 0.1/n
epsilon = 1e-5
errorbounds = 5e-6
RK4error = 1e-13

%Run false position with initial interval [6,7]
[A,B,PS,G_PS] = FalsePosition(@(p) G_n(p,a,n), 6,7,epsilon);

%Bounds is an array of the value of G at p_s + 5e-6 and p_s - 5e-6
Bounds = [arrayfun(@(p) G_n(p,a,n),PS - errorbounds), arrayfun(@(p) G_n(p,a,n),PS + errorbounds)]
%ErrorCheck is true if there is a sign change and both entries  of Bounds > RK4error
ErrorCheck = (Bounds(:,1) .* Bounds(:,2) < 0) & (abs(Bounds(:,1)) > RK4error) & (abs(Bounds(:,2)) > RK4error)

varNames = {'Iteration','p1','p2','ps','g(ps)','Within error bounds?'};
RK4Table = table((1:length(A)).', A, B,PS,G_PS,ErrorCheck,'VariableNames',varNames)

%G finds Y_n at x_n = 1 using RK4 method
function y = G_n(p,a,n)
    h = 1/n;
    [X,Y] = RK4vector(@(x,Y) [Y(2), -p^2 * (1+x)^(-a) * Y(1)],0,[0,1],1,h);
    y = Y(n+1);
end
