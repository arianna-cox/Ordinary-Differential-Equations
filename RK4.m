function [xsolution, ysolution] = RK4(f,initialx,initialY, finalx, h)
%This function uses the RK4 method to solve an ODE numerically with steps
%of size h starting at initialx and ending at finalx.
%It uses the initial condition y = initialy when x = initialx.
N = (finalx-initialx)/h;

Y=zeros(N+1,1);
X=zeros(N+1,1);
Y(1)=initialY;
X(1)=initialx;
for k = 1:N
    k1=h*f(X(k),Y(k));
    k2=h*f(X(k)+h/2,Y(k)+k1/2);
    k3=h*f(X(k)+h/2,Y(k)+k2/2);
    k4=h*f(X(k)+h,Y(k)+k3);
    X(k+1)=X(k)+h;
    Y(k+1)=Y(k)+((k1+2*k2+2*k3+k4)/6);
end

xsolution = X;
ysolution = Y;
end

