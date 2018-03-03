import math

"""
    作者：kwq
    版本：v1.0
    日期：20180303
    文件名：squareRoot.py
    功能：使用梯度下降算法求正整数a的平方根
    
"""

learning_rate = 0.1
a = 99
x = 0
for i in range(2000):
    x -= learning_rate * (x**2 - a)
print("预测值: %f  真实值: %f" %(x, math.sqrt(a)))





