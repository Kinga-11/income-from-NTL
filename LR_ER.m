%  Linear Regression & Error reducing
data = (csvread(input(('fisier csv:  ')),1,1));
m = length(data(:,1)); 
n  = length (data(1,:))/2;
Solar = zeros(m,n);
Venit = zeros(m,n);
Error = zeros(m,n);
for i = 1:n
   X = data(:, i+(i-1)); y = data(:, i+i);
   X = [ones(m, 1), X]; 
   theta = zeros(size(X, 2), 1);
   theta = pinv(X'*X)*(X'*y);
   estimate  = X*theta;
   error = estimate - y;
   solar = data(:, i+(i-1));
   venit = data (:,i+i);
   Solar(:,i) = solar;
   Venit(:,i) = venit;
   Error(:,i) = error;
   %save(['Solar' num2str(i)], 'solar')
 end 
mean_error = mean(Error,2);
X = mean(Solar,2);
y = mean(Venit,2);
X = [ones(m, 1), X];
theta = zeros(size(X, 2), 1);
theta = pinv(X'*X)*(X'*y);
dlmwrite('mean_error.txt', mean_error)
dlmwrite('theta.txt', theta)