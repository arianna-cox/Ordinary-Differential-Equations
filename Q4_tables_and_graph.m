clc
clear
format shortE

%Question4

%The following is equation (5a)
f = @(x,y) -4*y+4*exp(-2*x);

%Equation (6), which is the exact solution for equation (5a)
yexact = @(x) -2*exp(-4*x) + 2*exp(-2*x);

kmax = 15

H=zeros(kmax+1,1);
EnEuler=zeros(kmax+1,1);
EnRK4=zeros(kmax+1,1);
for k = [0:kmax]
    n = 2^k;
    h = 1.6/n;
    H(k+1) = h;
    %The numerical solution using Euler's method
    [X,YnumericalEuler] = Euler(f, 0, 0, 1.6, h);
    %The numerical solution using Euler's method
    [X,YnumericalRK4] = RK4(f, 0, 0, 1.6, h);
    %The exact solution
    [X,Yanalytic]  = Exact(yexact, 0, 1.6,h);
    %The global error at each step for both methods
    GlobalErrorEuler = YnumericalEuler - Yanalytic;
    GlobalErrorRK4 = YnumericalRK4 - Yanalytic;
    %The global error E_n at x_n = 1.6 for each method
    EnEuler(k+1) = GlobalErrorEuler(n+1);
    EnRK4(k+1) = GlobalErrorRK4(n+1);
end

% %Find the gradient of the line joining each step
% GradientEuler = [NaN];
% for k = 1:length(EnEuler)-1
%     GradientEuler(k+1,1) = log(abs(EnEuler(k+1)/EnEuler(k)))/log(2^(k)/2^(k+1));
% end
% 
% GradientRK4 = [NaN];
% for k = 1:length(EnRK4)-1
%     GradientRK4(k+1,1) = log(abs(EnRK4(k+1)/EnRK4(k)))/log(2^(k)/2^(k+1));
% end

varNames = {'h','E_n at x_n = 1.6 for Euler','E_n at x_n = 1.6 for RK4'};
TableOfErrors = table(H, EnEuler, EnRK4,'VariableNames',varNames)

logH = log(H);
logEnEuler = log(abs(EnEuler));
logEnRK4 = log(abs(EnRK4));

%Plot a log-log graph of global error at x_n=1.6 against h
plot(logH , logEnEuler, 'b')
hold on
plot(logH , logEnRK4, 'r')
xlabel('log(h)')
ylabel('log(|E_n|)')
legend('Euler','RK4')
hold off