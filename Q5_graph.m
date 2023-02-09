clc
clear

%Question 5

h=0.001;

%The following is equation (8a)
f = @(x,y) 4*y - 5*exp(-x);
%The initial condition; equation (8b)
initialx = 0;
initialy = 1;

%Integrates numerically from x=0 to x=10
finalx = 10;
%Number of steps
N= finalx/h;

%The numerical solution using Euler's method
[X,Ynumerical] = Euler(f, initialx, initialy, finalx, h);

%Equation (8c), which is the exact solution for equation (8a)
yexact = @(x) exp(-x);
[X,Yanalytic]  = Exact(yexact,initialx,finalx,h);

GlobalError = Ynumerical - Yanalytic;

varNames = {'x_n','Global Error, E_n'};
TableError = table(X, GlobalError,'VariableNames',varNames);

%Using linear regression to find the gradient of the graph
logError = log(abs(GlobalError));
LinearRegression = fitlm(X(2:N+1),logError(2:N+1));
gradient = LinearRegression.Coefficients.Estimate(2);

plot(X, logError,'k')
hold on
xlabel('x_n')
ylabel('log(|E_n|)')
hold off

GrowthRate= gradient