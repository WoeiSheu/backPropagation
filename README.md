### Requirement
#### 应用BP神经网络逼近非线性函数, 要求:
1. 非线性函数形式自选, 要求必须是多个自变量输入的非线性函数, 可以是单输出也可以是多输出, 例如: y=sin(x1)+sin(x2), 即可视为两个自变量一个因变量的非线性函数, 符合本次作业要求. 而形如 y=sin(x)+cos(x)+e^{-x} 的函数均为一个自变量的非线性函数, 不符合本作业的要求. 不符合要求的作业记为0分
2. 逼近误差 < 5%, 即: 应用测试数据对网络进行测试时, 神经网络输出与期望值的最大误差的绝对值小于期望值的5%
3. 学习方法为经典的BP算法或改进形式的BP算法, 鼓励采用改进形式的BP算法
4. 不允许采用matlab中现有的关于神经网络建立、学习、仿真的任何函数及命令, 如果采用, 作业无效, 平时成绩该项为0分
5. 提交实验结果报告, 提交源程序并加适当注释, 并保证能顺利运行出正确结果


### pseudocode
```
initialize network weights (often small random values)
do
    forEach training example named ex
        prediction = neural-net-output(network, ex)  // forward pass
        actual = teacher-output(ex)
        compute error (prediction - actual) at the output units
        compute Delta_w_h for all weights from hidden layer to output layer  // backward pass
        compute Delta_w_i for all weights from input layer to hidden layer   // backward pass continued
        update network weights // input layer not modified by error estimate
until all examples classified correctly or another stopping criterion satisfied
return the network
```

### Reference
+ <http://www.cnblogs.com/liuwu265/p/4696388.html>
+ <http://web.stanford.edu/class/cs294a/sparseAutoencoder_2011new.pdf>

### Test
1. test1.fig. y = sin(x1) + sin(x2) + sin(x3) + ... 
   ```
   inputNum = 2;
   hiddenNum = 36;
   outputNum = 1;
   sampleNum = 2000;
   learningRate = 0.01;
   iterationNum = 1000;
   ```
2. y = log(x1 + x2 + x3 + ...)
