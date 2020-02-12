clear ; close all; clc

inp_iterations = input('Please input iterations: ');						%��������
inp_alpha = input('Please input alpha: ');							%ѧϰ����

%% ========== ��ȡ���� ==========
fprintf('\nLoading dataset...\n');
data = load('ex1data1.txt');
n = size(data,2);						%����+�������������
m = size(data,1);						%��������������
X = data(:,1:n-1);					%������������ֵ����X
y = data(:,n);						%�������

%% ========== �鿴ɢ��ͼ���������� ==========
fprintf('\nPlotting Data...\n');
figure;
plot(X, y, 'rx', 'MarkerSize', 10);			%��СΪ10�ĺ�ɫʮ��ɢ��
xlabel('description of x-axis');
ylabel('description of y-axis');
%kbhit();							%��ͣ

%% ========== ��ʼ�� ==========
fprintf('\nInitialing Variables...\n');
X = [ones(m, 1), X];					%����һ�г���1
theta = zeros(n, 1);					%��ʼ��thetaΪnά����
fprintf('\n');
iterations = inp_iterations;						%��������
alpha = inp_alpha;							%ѧϰ����

%% ========== �ݶ��½��� ==========
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);
fprintf('\nTheta computed from gradient descent: \n');
fprintf(' %f \n', theta);
%kbhit();

%% ========== �������Իع�ó������Ժ������������� ==========
hold on;								%����ɢͼ�л���
plot(X(:,2:size(X,2)), X*theta, '-');			%X��2~n����-�߻���
legend('Training data','Linear regression');
hold off;

%% ========== ѧϰ����-����������ϵͼ ==========
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

%% ========== �ݶ��½����Իع�Ԥ�� ==========
%�ݶ��½�������Ҫ�Բ���������Ӧ����������
x_pre = [1650];
x_pre = [ones(size(x_pre,1),1),x_pre];		%����1��
price = x_pre * theta;
fprintf(['\nPredicted price ' ...
         '(using gradient descent):\n $%f\n'], price);

%% ========== ��ʧ�������ԣ��������� ==========
checkJtheta(X, y, theta);

%% ========== ���淽�̷� ==========
theta = normalEqn(X, y);
fprintf('\nTheta computed from gradient descent: \n');
fprintf(' %f \n', theta);
%kbhit();
         
%% ========== ���淽�����Իع�Ԥ�� ==========
%���淽�̷�ֱ�Ӵ����������
x_pre = [1650];
x_pre = [ones(size(x_pre,1),1),x_pre];
price = x_pre * theta;
fprintf(['\nPredicted price' ...
         '(using normal equations):\n $%f\n'], price);