# 吴恩达（斯坦福）机器学习笔记

[toc]

[吴恩达-机器学习（Coursera）](https://www.coursera.org/learn/machine-learning)

## Lesson 1 概述

### 1 定义

*Arthur Samuel*

“Field of study that gives computers the ability to learn without being explicitly programmed.”

> 机器学习：在没有进行特定编程的情况下给予计算机学习能力的领域。



*Tom Mitchell*

*“A computer program is said to *learn* from experience E with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E.”*

> 机器学习：机器学习是为了执行**任务T**，从**经验E**中学习，用**表现P**来评判它完成任务的性能，并从中提升。



**举例**

- 过滤垃圾邮件

用Tom的定义来说，T=正确分类垃圾邮件和普通邮件，E=查看你对邮件的人工标记（是否是垃圾邮件），P=正确分类的数量或概率。



### 2 学习算法

#### 2.1 监督学习

监督学习：提供“正确答案”的数据集，来**教**计算机如何学习

##### 2.1.1 回归问题

回归问题：预测出连续值属性的类型

**举例**

- 房价预测

根据已知的**面积-房价**数据，得到一条较为拟合的函数（图中的紫色非线性函数，蓝色线性函数），通过回归预测出X面积房子的房价Y。

![房价预测](https://s2.ax1x.com/2020/01/02/lt0lw9.png)





##### 2.1.2 分类问题

分类问题：预测出离散值属性的类型

**举例**

- 肿瘤预测

根据已知的**年龄;肿瘤大小-良性/恶性**数据，得到一条拟合直线来区分良性和恶性，从而通过年龄和肿瘤大小来判断肿瘤是良性或恶性的（蓝圈良性，红叉恶性）。

![肿瘤预测](https://s2.ax1x.com/2020/01/02/lt08F1.png)



通过例子，我们了解到，我们需要通过事物的许多属性（房子面积、肿瘤大小和患者年龄等）来得到我们需要的结果（房价、良性或恶性）。属性是影响结果的一些关键性因素，而在实际中，我们影响事物的属性非常多，可计算机存储空间有限，不可能存放无限多的属性，所以我们要用到 **支持向量机** 来解决这个问题。支持向量机通过一个简洁的数学技巧，允许计算基础护理无限多的属性。



#### 2.2 非监督学习

非监督学习：没有正确答案的数据集，让计算机从中自主找到某种蕴含的结构

##### 2.2.1 聚类算法

聚类算法：找出数据集中“蕴含”的分类

**举例**

- 肿瘤分类

![肿瘤分类](https://s2.ax1x.com/2020/01/02/lt0GJx.png)

- 新闻分类

![image-20200102182137114](https://s2.ax1x.com/2020/01/02/lt01oR.png)





**鸡尾酒会算法**

通过Microphone #1和Microphone #2的声音，分离仅有出Speaker #1和Speaker #2的声音

![鸡尾酒会算法](https://s2.ax1x.com/2020/01/02/ltscNj.png)

```octave
[W,s,v]=svd((repmat(sum(x.*x,1),size(x,1),1).*x)*x');
# svd:奇异值分解
```



---

## Lesson 2 模型与代价函数

### 1 定义

m=训练集样本数量

x=输入变量/特征

y=输出变量

h=映射函数(hypothesis)

轮廓图(contour plot)

![轮廓图](https://s2.ax1x.com/2020/01/07/l6dFgg.png)

1. 相同颜色的每一圈表示$J(\theta_0,\theta_1)$值相等点集合
2. $J(\theta_0,\theta_1)$最小值的点在圈最小的点集中

### 2 代价函数的选择

#### 2.1 线性回归函数

假设函数：$h_θ(x)=θ₀+θ₁x$

![线性回归](https://s2.ax1x.com/2020/01/07/l6lXo4.png)

代价函数选择思路：选择一个函数$J(θ_0,θ_1)$，使得样本$y$与$h_θ(x)$之差最小。



**假设函数和代价函数的区别：**

假设函数是输入值和输出值的函数，是我们解决问题最终需要得到的函数，我们应该尽量使其与样本数据拟合。

代价函数是为了求解最优假设函数而设的函数，其目的是得到假设函数中的各个常量值。代价函数衡量了假设函数与实际问题之间的接近程度。



##### 2.1.1 平方差函数

**Hypothesis:** $h_\theta(x)=\theta_0+\theta_1x$

**Parameters:** $\theta_0,\theta_1$

**Cost Function:** $J(\theta_0,\theta_1)=\frac{1}{2m}  \sum ^m _{i=1} (h_θ(x^{(i)})-y^{(i)})^2$

**Goal:** $J(\theta_0,\theta_1)min$

> 问：此处本来乘以1/m即可，为什么要乘以1/2m呢？
>
> 答：因为我们需要求$J_{min}$，利用梯度下降法对J求导时，如果是1/2m，求导结果为：$\frac{\partial J}{\partial {\theta}_i}=\frac{1}{m} \sum ^m _{i=1} (h_\theta(x^{(i)})-y^{(i)}) \frac{\partial h_{\theta}(x^{(i)})}{\partial \theta}$，正好求导时平方的2可以消去，简化了计算。
>
> 这里无论除以2m还是m，函数J最小值的θ都是相同的。

![平方差函数](https://s2.ax1x.com/2020/01/07/l6YfoT.png)



### 3 最小化代价函数方法

#### 3.1 梯度下降法

梯度下降法的计算过程就是沿梯度下降/上升的方向求解极小值/极大值（局部/全局最优解）。

用于线性回归的代价函数都是“弓型”的，即凸函数，不存在局部最优解，一定存在并且仅有一个全局最优解。	



**求解步骤：**

1. 选择一个代价函数$J(\theta_0,\theta_1 )$
2. 初始化：$(\theta_0,\theta_1)=(0,0)$
3. 选择一个学习速率$\alpha$ (即梯度下降的速度)  
4. 令$\theta_j:=\theta_j-\alpha \frac{\partial}{\partial \theta_j} J(\theta_0,\theta_1)$
5. 检查$\theta_j$是否趋于收敛（$\frac{\partial}{\partial \theta_j} J(\theta_0,\theta_1) \to 0$ 或 $\theta_j \to \theta_{j-1}$），若收敛则得到$(\theta_0,\theta_1)$，反之重复步骤3

![梯度下降求解](https://s2.ax1x.com/2020/01/07/l6DnL4.png)



关于初始值：

1. 若代价函数存在多个局部最优解，则从不同的初始值进行梯度下降，可能得到不同的局部最优解。

![局部最优解](https://s2.ax1x.com/2020/01/07/l6yc6K.png)



关于偏导：

1. $\theta_0:=\theta_0-\alpha \frac{1}{m} \sum ^m _{i=1} (h_θ(x^{(i)})-y^{(i)}) $
2. $\theta_1:=\theta_1-\alpha \frac{1}{m} \sum ^m _{i=1} (h_θ(x^{(i)})-y^{(i)})\cdot x^{(i)}$ 



关于学习速率$\alpha$ ：

1. $\alpha$如果过大，可能导致无法收敛；过小，可能导致求解速度太慢。
2. $\alpha$不需要在循环中改变大小的原因：因为越接近min，导数越接近0，所以导×$\alpha$也会趋于0，故梯度下降算法会自动采取更小的下降步法。

![梯度下降步法自动减小](https://s2.ax1x.com/2020/01/07/l6gIh9.png)



**梯度下降的三种形式：**

- 批量梯度下降（Batch Gradient Descent，BGD）

$$J(\theta_0,\theta_1)=\frac{1}{2m}  \sum ^m _{i=1} (h_θ(x^{(i)})-y^{(i)})^2$$

```伪代码
repeat{
    θj:=θj−α1m∑mi=1(hθ(x(i))−y(i))x(i)j
	(for j =0,1)
}
```



- 随机梯度下降（Stochastic Gradient Descent，SGD）

$$J^{(i)}(\theta_0,\theta_1)=\frac{1}{2} (h_θ(x^{(i)})-y^{(i)})^2$$

```伪代码
repeat{
	for i=1,...,m{
		θj:=θj−α(hθ(x(i))−y(i))x(i)j
		(for j =0,1)
	}
}
```



- 小批量梯度下降（Mini-Batch Gradient Descent, MBGD）

$$J(\theta_0,\theta_1)=\frac{1}{2m}  \sum ^k _{i=1} (h_θ(x^{(i)})-y^{(i)})^2 ,k\in(0,m)$$

```伪代码
repeat{
	for i=1,11,21,31,...,991{
		θj:=θj−α110∑(i+9)k=i(hθ(x(k))−y(k))x(k)j
		(for j =0,1)
	}
}
```



参考：

[三种梯度下降形式的介绍](https://www.cnblogs.com/lliuye/p/9451903.html)

[梯度下降理解](https://www.jianshu.com/p/c7e642877b0e)
