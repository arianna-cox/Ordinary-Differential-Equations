function [xsolution, ysolution] = RK4vector(f,initialx,initialY, finalx, h)
%This function uses the fourth-order RungeKutta method to solve an ODE
%numerically with n steps of size h and initial value initialy when x
%equals initial x
N = (finalx-initialx)/h;


Y=zeros(N+1,2);
X=zeros(N+1,1);
Y(1,:)=initialY;
X(1)=initialx;
for k = 1:N
    k1=h*f(X(k),Y(k,:));
    k2=h*f(X(k)+h/2,Y(k,:)+k1/2);
    k3=h*f(X(k)+h/2,Y(k,:)+k2/2);
    k4=h*f(X(k)+h,Y(k,:)+k3);
    X(k+1)=X(k)+h;
    Y(k+1,:)=Y(k,:)+((k1+2*k2+2*k3+k4)/6);
end

xsolution = X;
ysolution = Y;
end
