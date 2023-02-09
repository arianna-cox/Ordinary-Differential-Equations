clear
clc

%Question 9
a = 8;

%Plot of Y_n at x_n = 1 against p
plot1 = subplot(2,1,1);
set(get(plot1,'XLabel'), 'String', 'p')
set(get(plot1,'YLabel'), 'String', 'Y_n at x_n=1')
hold on
plotRange = 60
Xrange = 0:0.1:plotRange;
ys = arrayfun(@(p)G(p,8),Xrange);
plot(Xrange,ys);
plot([0,plotRange],[0,0])
hold off

%Find first five roots, assuming no two roots share an interval (n, n+1)
x1 = 0;
x2 = 1;
roots = zeros(0,5);
rootsfound = 0;
while rootsfound < 5
    %Check for a sign change across an integer interval
    if G(x1,a)*G(x2,a) < 0
        %Run false position method over interval
        [A,B,PS] = FalsePosition(@(p) G(p,a),x1,x2,1e-9);
        roots(rootsfound+1) = PS(length(PS));
        rootsfound = rootsfound +1;
    end
    %Move on to next integer interval
    x1 = x1+1;
    x2 = x2+1;
end

errorbounds = 5e-6
RK4error = 1e-10

%Error check as described in answer to question 8
Bounds = [arrayfun(@(p) G(p,a),roots.' - errorbounds), arrayfun(@(p) G(p,a),roots.' + errorbounds)]
ErrorCheck = (Bounds(:,1) .* Bounds(:,2) < 0) & (abs(Bounds(:,1)) > RK4error) & (abs(Bounds(:,2)) > RK4error)

%Normalise and plot eigenfuntions
plot2 = subplot(2,1,2)
set(get(plot2,'XLabel'), 'String', 'x')
set(get(plot2,'YLabel'), 'String', 'y(x)')
hold on
%Plot the eigenfunction for each eigenvalue
for i = 1:5
   p = roots(i);
   h = 1/1000;
   [X,Y] = RK4vector(@(x,Y) [Y(2), -p^2 * (1+x)^(-a) * Y(1)],0,[0,1],1,h);
   Integrand = (1 + X).^8 .* Y(:,1).^2;
   %Find normalisation constant using trapz integration routine
   NormalisationConstant = sqrt(1/(trapz(X,Integrand)*p^2));
   plot(X(:,1),NormalisationConstant*Y(:,1))
   
end
legend('p = ' + string(roots));
hold off