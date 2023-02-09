clc
clear
format shortE

%Question 7

a=4;
p=6;

%Equations (16)
f = @(x,Y) [Y(2), -p^2 * (1+x)^(-a) * Y(1)];
%Initial condition (15)
initialx = 0;
initialY=[0,1];

%The exact solution for y
yexact = @(x) (1/p)*(1+x)*sin(p-p/(1+x));
%The exact solution for z = dy/dx
zexact = @(x) (1/p)*sin(p-p/(1+x))+(1+x)^(-1)*cos(p-p/(1+x));
%Exact solution y(1) when x=1
y1 = [yexact(1), zexact(1)];

kmax = 12;

H=zeros(kmax+1,1);
Yn = zeros(kmax+1,2);
En=zeros(kmax+1,2);
for k = [0:kmax]
    h = 0.1/(2^k);
    n = 1/h;
    H(k+1) = h;
    %Numerical solution using the vector generalisation of the RK4 method
    [X,YnumericalRK4] = RK4vector(f,initialx,initialY,1,h);
    Yn(k+1,:) = YnumericalRK4(n+1,:);
    En(k+1,:) = Yn(k+1,:) - y1;
end

varNames = {'h','Numerical Solution Y_n at x_n = 1','Global Error E_n at x_n = 1'};
RK4Table = table(H, Yn, En,'VariableNames',varNames)

plot(log(H),log(abs(En(:,1))))
hold on
plot(log(H),log(abs(En(:,2))))
xlabel('log(h)')
ylabel('log(|E_n|)')
legend('Y_n - y(1)', 'Z_n - z(1)')
hold off