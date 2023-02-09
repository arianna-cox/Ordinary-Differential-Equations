function [TableFull, TableError] = Q1_tables_and_graph(h)
%Question 1

%Equation (5a)
f = @(x,y) -4*y+4*exp(-2*x);
%The initial condition; equation (5b)
initialx = 0;
initialy = 0;

%The program integrates numerically from x=0 to x=12
finalx = 12;
%Number of steps
N= finalx/h;

%The numerical solution using the Euler method
[X,Ynumerical] = Euler(f, initialx, initialy, finalx, h);

%Equation (6), which is the exact solution for equation (5a)
yexact = @(x) -2*exp(-4*x) + 2*exp(-2*x);
[X,Yanalytic]  = Exact(yexact,initialx,finalx,h);

%The global error of the Euler method
GlobalError = Ynumerical - Yanalytic;

%Find (1/h)log(|En/En-1|) in order to approximate the growth rate
GrowthEachStep = [NaN];
for n = 1:length(GlobalError)-1
    GrowthEachStep(n+1,1) = log(abs(GlobalError(n+1)/GlobalError(n)))/h;
end

varNames = {'x_n','Y_n','Analytic Solution, y(x_n)','Global Error, E_n','log(E_n/E_(n-1))/h'};
TableFull = table(X,Ynumerical,Yanalytic,GlobalError, GrowthEachStep,'VariableNames',varNames);

varnames = {'x_n','Global Error, E_n','log(E_n/E_(n-1))/h'};
TableError = table(X,GlobalError,GrowthEachStep,'VariableNames',varnames);

%The following plots global error E_n against x_n
plot(X, GlobalError, 'k')
hold on
xlabel('x_n')
ylabel('E_n')
hold off
end

