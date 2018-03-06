import math

"""
    作者：kwq
    版本：v1.0
    日期：20180303
    文件名：squareRoot.py
    功能：使用梯度下降算法求正整数1-100的平方根
"""


if __name__ == "__main__":
    learning_rate = 0.01
    x = 0
    for a in range(1, 101):
        for i in range(2000):
            x -= learning_rate * (x**2 - a)
        print("数值:%d  预测平方根: %f  真实平方根: %f  差异值:%f" % (a, x, math.sqrt(a), math.sqrt(a) - x))

