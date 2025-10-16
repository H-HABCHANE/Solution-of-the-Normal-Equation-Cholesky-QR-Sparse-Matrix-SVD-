% file lls3.m
% Solution of a normal equation A’*A*x = A’*b
% with sparse matrix A via an augmented system
m = 50000; n = 2000; d = 0.0005;
A = sprand(m,n,d);
% sparse matrix m x n with d*m*n nonzero entries
A(1,:) = ones(1,n); % the first row is dense => nnz(A’*A) = n*n
b = randn(m,1);
% right hand side
M = [speye(m,m), A; A', sparse(n,n)];
v = [b;zeros(n,1)];
z = M\v;
x = z(m+1:end);
y = z(1:m);
s = A*x;
% augmented matrix
% right hand side of the augmented system
% solution of the augmented system
% solution of the normal equation
% solution of the dual
% projection of b onto im(A)
% checking of solution
fprintf('||A''*A*x-A''*b|| = %9.2e\n||b-(y+s)|| = %9.2e\ny''*s = %9.2e\n',...
norm(A'*A*x-A'*b),norm(b-s-y),y'*s);
% Number of nonzero matrix elements
fprintf('Normal equation nnz = %9.0f\nAugmented system nnz = %9.0f\n',...
nnz(A'*A),nnz(M));