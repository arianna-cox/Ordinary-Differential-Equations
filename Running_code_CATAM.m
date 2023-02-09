clear
clc
format long

%QUESTION 1
f = @(x,y) -4*y+4*exp(-2*x)
yexact = @(x) -2*exp(-4*x) + 2*exp(-2*x);
[X,Y] = Euler(f, 0, 0, 12, 2)
Q1_tables_and_graph(0.2)
% [X1,Y1] = RK4(f, 0, 0, 6, 2);
%[Xe,Ye] = Exact(yexact,0,6,2);

% Yan = []
% N = 20
% h = 0.6
% for n = 1:N
%     Yan(n,1)= ((4*h)/(exp(-2*h)+4*h-1))*(exp(-2*h*(12/h))-(1-4*h)^n)
% end


%GlobalError = Y-Ye;
% GlobalError1 = Y1-Ye;
% 
% % plot(X1,Y1)
% % hold on
% % plot(X,Y)
% % plot(Xe,Ye)
% % xlabel('x')
% % ylabel('y')
% % title('Euler')
% % hold off
% 
%G = log(abs(GlobalError));
% plot(X,G)
% 

%varNames = {'x_n','Y_n','Analytic Solution, y(x_n)','Global Error, E_n'};
%T = table(X,Y,Ye,GlobalError,'VariableNames',varNames)

%h = 0.4
%for h = [2,1,0.6,0.5,0.4,0.3,0.2]
    %[TableE, TableR] = Q1_Tabulate(h);
    %TableR
%end

% b= fitlm(X(2:7),G(2:7))
% gradient = b.Coefficients.Estimate(2)

a=4;
p=6;
% f1 = @(x,y) -p^2 * (1+x)^(-a) * y;
% f2 = @(x,z) z;
% fe = @(x) (-1/p)*(1+x)*sin(p/(1+x) -p);
% 
% % [X,Y,Z] = RK4vs(f1,f2, 0, 0,1, 10000, 0.001);
% [Xe,Ye] = Exact(fe,0,100,0.1);
% % 
% % plot(X,Y)
% % hold on
% % plot(Xe,Ye)
% % %plot(X,Z)
% 
%f = @(x,Y) [Y(2), -p^2 * (1+x)^(-a) * Y(1)];
% 
%[X,Y] = RK4vector(f,0,[0,1],1,0.1)
% plot(X,Y)
