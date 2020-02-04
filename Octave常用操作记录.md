# Octave常用操作记录

[toc]

## 基本操作

显示当前路径：`pwd`

改变当前目录：`cd ‘D:\Project\Octave’`

显示当前目录文件：`ls`

显示当前变量值：不打分号即可或直接输入变量名

小数显示位数：`format long/short`



## 运算操作

四则运算：`+ - * /`

次方运算：`^`

逻辑运算：`&&` `||` `XOR(,)` 

真假判断：`==` `~=`



## 变量操作

变量赋值：

```octave
a = 1;
a = 1,b = 2,c = 3;
```

矩阵赋值：

```octave
A = [1,2,3;4,5,6];
A = [1 2 3;4 5 6];
A = [1 2 3;
4 5 6];
```

向量赋值：

```octave
v = [1 2 3];			%行向量
v = [1;2;3];			%列向量
v = 1:0.1:2;			%初始值:步长:终点值 的行向量，步长可省略，默认为1
```



## 流程控制

if-else：

```octave
if i == 4,
%...代码块
elseif
%...代码块
else
%...代码块
end;
```

for循环：

```octave
for i=1:n,		%循环n次
%...循环体
end;
```

while循环：

```octave
while i <= n,
%...循环体
end;
```

break和continue：

```octave
break;
continue;
```



## 函数操作

定义函数：

```octave
function ret = functionName(var1,var2)
function [ret1,ret2] = functionName(var1,var2)			%返回多个函数值
%...函数内容
end;		%end意为’}‘，循环结束等地方也需要使用

[val1,val2]=functionname(var1,var2)				%函数返回值按“顺序”返回
```

添加函数库路径：

```
%Octave search path (url)
addpath('url')
```



## 常用函数

### 运算及显示

打印数值：

```octave
disp(a);
disp(sprintf('string %0.2f',var1));			%格式化打印数值
```

获取矩阵（向量）维数（行列中较大的）：

```octave
length(A);
```

获取矩阵行列数：

```octave
size(A);
```

求和：

```octave
sum(v);			%向量之和
sum(A);			%每一列的和
sum(A,2);		%每一行的和
```



### 图像

画图：

```octave
% (X,y)是散点集，(X,theta(1) + theta(2)*X)是函数图像，'xr'是记号和颜色
plot(X, y, 'xr', X, theta(1) + theta(2)*X);
```

标题及标签：

```octave
legend('Training Data','Linear Regression');		%标题
xlabel('Number of hydrocarbons in molecule');		%x轴标签
ylabel('Heat release when burned(kJ/mol)');			%y轴标签
title('name1','name2');								%函数名称
```

直方图：

```octave
hist(A);
```

横坐标：

```octave
t = [0:1:10];				%0是起点，1是步长，10是终点
```

多个图像绘制：

```octave
hold on;				%将新图像绘制在旧图像上
subplot(1,2,1);			%将两个图像并排显示（1*2的格子）
```

图像保存：

```octave
print -dpng 'name.png'
```

关闭图像：

```octave
close					%图像关闭
clf;					%图像清除
```

图像编号：

```octave
figure(4);
```

改变轴刻度：

```octave
axis([1 2 3 4]);			%横起点 横终点 纵起点 纵终点
```

可视化矩阵：

```octave
imagesc(A);
colorbar;
colorgray;
```



### 矩阵

单位阵生成：

```octave
E = eye(4);
```

全k矩阵生成：

```octave
A = k*ones(3,4);			%3行4列全k矩阵
A = zeros(3,4);				%3行4列零阵
```

随机矩阵生成：

```octave
R = rand(3,4);				%3行4列随机阵，值介于0~1
```

正态分布随机变量阵：

```octave
W = randn(3,4);
```

矩阵读取：

```octave
A(2,:)					% : 指该行/列所有元素
A([1 3],:)				% 取第1和3行的所有元素
```

附加矩阵：

```octave
A = [A,[1;2;3]];
```

同型矩阵对应项运算：

```octave
A.+B;
A.-B;
A.*B;
A./B;
A.^B;
```

转置：

```octave
A';
```

取对数：

```octave
log(A);
```

绝对值：

```octave
abs(A);
```

e为底的指数函数：

```
exp(A);
```

取最值：

```octave
max(A);					%每列最大值
min(B);					%每列最小值

max(max(A));			%可取矩阵中最大值
max(A(:));
min(min(A));			%可取矩阵中最小值
min(A(:));

max(A,[],1);			%作用等同于max(A)
max(B,[],2);			%返回每行最大值
```

比较：

```octave
a < 5;					%得到真假值的向量
A < 5;					%得到真假值的矩阵

find(a < 5);			%得到
```

魔方矩阵：

```octave
%魔方矩阵：行、列、对角线之和相等
A = magic(4);
```

元素乘积：

```octave
prod(v);
prod(A);				%每列乘积
```

取整：

```octave
floor(v);				%向下取整
ceil(v);				%向上取整
```



### 文件读取

获取txt文件数据：

```octave
data = load('D:\trainingset.txt');		%data是矩阵
data = load trainingset;				%文件位于当前目录时可以这样用
X = data(:,1);						%获取矩阵的第1列
y = data(:,2);						%获取矩阵的第2列
```



### 系统

显示当前变量：

```octave
who					%变量
whos				%变量及详情
```

清除变量：

```octave
clear				%清除所有变量
clear var1			%清除变量var1
```

存储变量：

```octave
save hello.mat var1;			%存储进二进制文件mat中
save hello.txt var1 -ascii;		%以ASCII编码存入txt文件中
```

