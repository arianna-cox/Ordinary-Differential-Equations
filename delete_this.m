f = @(x,Y) 4*Y - 5*exp(-x) 

syms Yn x h
k1 = simplify(h*f(x,Yn))
k2 = simplify (h*f(x+0.5*h,Yn + 0.5*k1))
k3 = simplify (h*f(x+0.5*h,Yn + 0.5*k2))
k4 = simplify (h*f(x+h,Yn + k3))

Yn1 = simplify (Yn + (k1+2*k2+2*k3+k4)/6)