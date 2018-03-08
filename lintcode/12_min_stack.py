"""
    题目：12. Min Stack
    地址：http://www.lintcode.com/en/problem/min-stack/
    算法：最小栈
    时间：20180308
"""


class MinStack:
    def __init__(self):
        self.items = []
    # do intialization if necessary

    """
    @param: number: An integer
    @return: nothing
    """

    def push(self, number):
        self.items.append(number)

    # write your code here

    """
    @return: An integer
    """

    def pop(self):
        num = self.items[len(self.items) - 1]
        self.items.pop()
        return num
    # write your code here

    """
    @return: An integer
    """

    def min(self):
        return min(self.items)
# write your code here

if __name__ == "__main__":
    mins = MinStack()
    mins.push(1)
    mins.push(2)
    mins.push(3)
    print(mins.min())
    print(mins.pop())
    print(mins.min())
    print(mins.pop())
    print(mins.min())
