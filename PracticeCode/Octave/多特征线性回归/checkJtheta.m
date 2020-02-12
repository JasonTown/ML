%判断损失函数是否正常工作
function checkJtheta(X, y, theta)

fprintf('\nVisualizing J(theta_0, theta_1) ...\n');

theta0_vals = linspace(-10, 10, 100);			%theta0范围
theta1_vals = linspace(-1, 4, 100);				%theta1范围
J_vals = zeros(length(theta0_vals), length(theta1_vals));	%初始化J为0阵

% 计算不同θ范围内，J的值
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

J_vals = J_vals';

% 曲面图
figure;
subplot(1,2,1);
surf(theta0_vals, theta1_vals, J_vals);
xlabel('\theta_0'); ylabel('\theta_1');

% 轮廓图
subplot(1,2,2);
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

end