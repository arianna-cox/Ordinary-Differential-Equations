clc
clear
format short

%Question3

h=0.4;
%Integrates numerically from x=0 to x=6
finalx = 6;
%Number of steps
N= finalx/h;

%The following is equation (5a)
f = @(x,y) -4*y+4*exp(-2*x);
%The initial condition; equation (5b)
initialx = 0;
initialy = 0;
[X,YnumericalEuler] = Euler(f, initialx, initialy, finalx, h);
[X,YnumericalRK4] = RK4(f, initialx, initialy, finalx, h);
%Equation (6), which is the exact solution for equation (5a)
yexact = @(x) -2*exp(-4*x) + 2*exp(-2*x);
[X,Yanalytic]  = Exact(yexact,initialx,finalx,h);

varNames = {'n' 'x_n','Y_n Euler','Y_n RK4'};
Table = table([0:N].',X,YnumericalEuler, YnumericalRK4,'VariableNames',varNames)

plot(X, YnumericalEuler, 'b-x')
hold on
plot(X, YnumericalRK4, 'r-x')
plot(X, Yanalytic, 'k')
xlabel('x_n')
legend('Euler','RK4','Exact solution')
hold off