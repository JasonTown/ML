data = load('trainingset.txt');
X = data(:,1);
y = data(:,2);

%定义梯度下降算法
function theta = gradientDescent(X, y, alpha, iteraNum)
theta = [0;0];
m = length(y);
for i=1:iteraNum;
dist = theta(1) + X*theta(2) - y;
theta(1) = theta(1) - alpha*(1/m)*sum(dist);
theta(2) = theta(2) - alpha*(1/m)*sum(dist.*X);
end;
end;

%默认学习速率为0.01 迭代次数为5000次
theta = gradientDescent(X, y, 0.01, 5000);
plot(X, y, 'xr', X, theta(1) + theta(2)*X);
legend('Training Data','Linear Regression');
xlabel('Number of hydrocarbons in molecule');
ylabel('Heat release when burned(kJ/mol)');

%theta = [-569,60; -530,91]