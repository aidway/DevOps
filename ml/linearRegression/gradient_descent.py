import matplotlib.pyplot as plt
import numpy as np
import random
import time

"""
    作者：kwq
    版本：v1.0
    日期：20180303
    文件名：bgd.py
    功能：使用梯度下降算法进行线性回归
    http://blog.csdn.net/sxf1061926959/article/details/66976356?locationNum=9&fps=1
"""


def gradient_descent(learning_rate, init_k, init_b, iter_num):
    new_k = init_k
    new_b = init_b
    for i in range(iter_num):
        dk, db = get_gradient2(new_k, new_b)
        new_k -= learning_rate * dk
        new_b -= learning_rate * db
        # print(dk, db)
    return new_k, new_b


def get_gradient1(old_k, old_b):
    new_k = 0
    new_b = 0
    n = len(data)
    # m = random.randint(1, n)
    for i in range(0, n):
        xi = data[i, 0]
        yi = data[i, 1]
        new_k += -2 / n * xi * (yi - (old_k * xi + old_b))
        new_b += -2 / n * (yi - (old_k * xi + old_b))
    return new_k, new_b


def get_gradient2(old_k, old_b):
    dk = 0
    db = 0
    n = len(data)
    x = data[:, 0]
    y = data[:, 1]

    dk = -2.0 / n * x * (y - (old_k * x + old_b))
    db = -2.0 / n * (y - (old_k * x + old_b))
    return np.sum(dk, axis=0), np.sum(db, axis=0)


def numerical_solution():
    x = data[:, 0]
    y = data[:, 1]
    x_mean = np.mean(x, axis=0)
    y_mean = np.mean(y, axis=0)
    n = len(data)
    k_tmp = np.sum(y * (x - x_mean), axis=0) / (np.sum(x ** 2, axis=0) - 1.0 / n * (np.sum(x)) ** 2 )
    b_tmp = 1.0 / n * (np.sum(y - k_tmp * x))
    return k_tmp, b_tmp


def plot_data():
    x = data[:, 0]
    y = data[:, 1]
    y_predict = k * x + b
    y_best = k_best * x + b_best

    plt.text(5, 8, r'$y = '+str(round(k, 2))+'*x+'+str(round(b, 2))+'$', fontsize=20,
             bbox={'facecolor': 'yellow', 'alpha': 0.05})
    plt.plot(x, y, 'o')
    plt.plot(x, y_predict, 'k-')
    plt.plot(x, y_best)
    plt.show()


if __name__ == "__main__":
    start = time.time()
    data = np.loadtxt('gradient_descent.csv', delimiter=',')
    k, b = gradient_descent(0.01, 0, 0, 20000)
    k_best, b_best = numerical_solution()
    print("gradient solution: k=%f b=%f" %(k, b))
    print("numerical solution: k=%f b=%f" % (k_best, b_best))
    plot_data()
    end = time.time()
    print(end - start)


