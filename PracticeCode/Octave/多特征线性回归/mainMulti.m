clear ; close all; clc

inp_iterations = input('Please input iterations: ');						%��������
inp_alpha = input('Please input alpha: ');							%ѧϰ����

%% ========== ��ȡ���� ==========
fprintf('\nLoading dataset...\n');
data = load('ex1data2.txt');
n = size(data,2);						%����+�������������
m = size(data,1);						%��������������
X = data(:,1:n-1);					%������������ֵ����X
y = data(:,n);						%�������

%% ========== ������׼������������ ==========
[X mu sigma] = featureNormalize(X);			%�õ���׼����X�Լ���ֵ�ͱ�׼��

%% ========== ��ʼ�� ==========
fprintf('\nInitialing Variables...\n');
X = [ones(m, 1), X];					%����һ�г���1
theta = zeros(n, 1);					%��ʼ��thetaΪnά����
iterations = inp_iterations;						%��������
alpha = inp_alpha;							%ѧϰ����

%% ========== �ݶ��½��� ==========
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);
fprintf('\nTheta computed from gradient descent: \n');
fprintf(' %f \n', theta);
%kbhit();

%% ========== �ݶ��½����Իع�Ԥ�� ==========
%�ݶ��½�����Ԥ��ʱ��Ҫ�Բ���������Ӧ����������
x_pre = [1650 3];
x_pre_norm = (x_pre - mu)./sigma;							%������׼��
x_pre_norm = [ones(size(x_pre_norm,1),1),x_pre_norm];		%����1��
price = x_pre_norm * theta;
fprintf(['\nPredicted price ' ...
         '(using gradient descent):\n $%f\n'], price);

%% ========== ѧϰ����-����������ϵͼ ==========
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

%% ========== ���淽�̷� ==========
X = data(:,1:n-1);					%����������׼��Ӱ��
X = [ones(m, 1), X];					%����һ�г���1
theta = normalEqn(X, y);
fprintf('\nTheta computed from gradient descent: \n');
fprintf(' %f \n', theta);
%kbhit();

%% ========== ���淽�����Իع�Ԥ�� ==========
%���淽�̷�ֱ�Ӵ����������
x_pre = [1650 3];
x_pre = [ones(size(x_pre,1),1),x_pre];
price = x_pre * theta;
fprintf(['\nPredicted price' ...
         '(using normal equations):\n $%f\n'], price);