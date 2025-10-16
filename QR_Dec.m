% file lls2.m
t = (-1:0.05:1)''; % data
p = [-1, 1, 2, -1, 1];
y = polyval(p,t);
plot(t,y,':')
y = y + 0.1*randn(size(y));
hold on
plot(t,y,'o')
A = [ones(size(t)), t, t.^2, t.^3, t.^4]; % matrix A and rhs
b = y;
s = A\b % LLS solution with backslash
plot(t,s(1)+s(2)*t+s(3)*t.^2+s(4)*t.^3+s(5)*t.^4,'r');
hold off
[Q,R] = qr(A,0); % reduced QR decomposition
x = R\(Q'*b)
norm(x-s)