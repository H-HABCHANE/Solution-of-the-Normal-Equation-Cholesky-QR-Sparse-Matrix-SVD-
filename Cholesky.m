% file lls1.m
t = (1:20)'; y = -2*t +1;
% generate data
y = y + randn(size(y));
plot(t,y,'o')
A = [ones(size(t)), t]; b = y; % matrix A and right hand side vector b
s = A\b;
% solution of LLS with backslash operator
hold on
plot(t,s(1)+s(2)*t,'r')
% plot of the regression line
hold off
R = chol(A'*A)
u = R'\(A'*b)
x = R\u% Cholesky decomposition
% Forward substitution
% Backward substitution
norm(x-s)