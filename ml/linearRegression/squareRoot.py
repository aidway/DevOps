import math

learning_rate = 0.1
a = 99
x = 0
for i in range(2000):
    x -= learning_rate * (x**2 - a)
print("预测值: %f  真实值: %f" %(x, math.sqrt(a)))





