% file lls4.m
n = 40; m = 5*n; % Size of A
j = 0:n-1; sigma = 2.^(-j); % Building singular values
% Making m by n matrix A with prescribed singular values
% normally the outputs are [U,R], [V,R] but R is not used and replaced by  ̃.
X = randn(m); [U, ~] = qr(X,0); X = randn(n); [V, ~] = qr(X);
A = U(:,1:n)*diag(sigma)*V';
% Checking of the condition number of A
fprintf('condition number of A = %9.2e\n',cond(A));
% Building rhs b
x = ones(n,1); b = A*x;
% Solving LLS via the normal equation
xne = (A'*A)\(A'*b);
fprintf('relative error (normal eq.) = %9.2e\n' ,norm(x - xne)/norm(x));
% Solving LLS via SVD
[U,S,V] = svd(A,0); xsvd = V*(S\U'*b);
fprintf('relative error (svd solution) = %9.2e\n',norm(x - xsvd)/norm(x));