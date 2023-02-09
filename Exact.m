function [xsolution, ysolution] = Exact(f,initialx, finalx, h)
%This function calculates the exact solution y(x_n) for x_n 
%from initialx to finalx with step-size h

%Number of steps
N=(finalx - initialx)/h;

%Exact solution
Y=zeros(N+1,1);
X=zeros(N+1,1);
for k = 1:N+1
    X(k)=initialx+(k-1)*h;
    Y(k)=f(X(k));
end

xsolution = X;
ysolution = Y;
end