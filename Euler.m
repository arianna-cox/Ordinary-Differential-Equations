function [xsolution, ysolution] = Euler(f,initialx,initialy, finalx, h)
%This function uses the Euler method to solve an ODE numerically from
%initalx to finalx with steps of size h
%The initial condition is that Y_0 equals initialy when x_0 equals initialx

%Find the number of steps
N=(finalx-initialx)/h;

Y=zeros(N+1,1);
X=zeros(N+1,1);
Y(1)=initialy;
X(1)=initialx;
%The following performs N steps of the Euler method
for k = 1:N
    X(k+1)=X(k)+h;
    Y(k+1)=Y(k)+h*f(X(k),Y(k));
end

xsolution = X;
ysolution = Y;
end

