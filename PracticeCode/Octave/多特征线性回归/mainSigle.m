clear ; close all; clc

inp_iterations = input('Please input iterations: ');						%迭代次数
inp_alpha = input('Please input alpha: ');							%学习速率

%% ========== 读取数据 ==========
fprintf('\nLoading dataset...\n');
data = load('ex1data1.txt');
n = size(data,2);						%特征+结果数（列数）
m = size(data,1);						%样本数（行数）
X = data(:,1:n-1);					%多特征的属性值矩阵X
y = data(:,n);						%结果向量

%% ========== 查看散点图（单特征） ==========
fprintf('\nPlotting Data...\n');
figure;
plot(X, y, 'rx', 'MarkerSize', 10);			%大小为10的红色十字散点
xlabel('description of x-axis');
ylabel('description of y-axis');
%kbhit();							%暂停

%% ========== 初始化 ==========
fprintf('\nInitialing Variables...\n');
X = [ones(m, 1), X];					%补充一列常数1
theta = zeros(n, 1);					%初始化theta为n维向量
fprintf('\n');
iterations = inp_iterations;						%迭代次数
alpha = inp_alpha;							%学习速率

%% ========== 梯度下降法 ==========
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);
fprintf('\nTheta computed from gradient descent: \n');
fprintf(' %f \n', theta);
%kbhit();

%% ========== 画出线性回归得出的线性函数（单特征） ==========
hold on;								%在离散图中画线
plot(X(:,2:size(X,2)), X*theta, '-');			%X的2~n列用-线画出
legend('Training data','Linear regression');
hold off;

%% ========== 学习速率-迭代次数关系图 ==========
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

%% ========== 梯度下降线性回归预测 ==========
%梯度下降法，需要对参数进行相应的特征处理
x_pre = [1650];
x_pre = [ones(size(x_pre,1),1),x_pre];		%补充1列
price = x_pre * theta;
fprintf(['\nPredicted price ' ...
         '(using gradient descent):\n $%f\n'], price);

%% ========== 损失函数调试（单特征） ==========
checkJtheta(X, y, theta);

%% ========== 正规方程法 ==========
theta = normalEqn(X, y);
fprintf('\nTheta computed from gradient descent: \n');
fprintf(' %f \n', theta);
%kbhit();
         
%% ========== 正规方程线性回归预测 ==========
%正规方程法直接代入参数即可
x_pre = [1650];
x_pre = [ones(size(x_pre,1),1),x_pre];
price = x_pre * theta;
fprintf(['\nPredicted price' ...
         '(using normal equations):\n $%f\n'], price);