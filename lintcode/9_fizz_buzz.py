"""
    题目：9. Fizz Buzz
    地址：http://www.lintcode.com/en/problem/fizz-buzz/
    算法：列表生成
    时间：20180308
"""


class Solution:
    """
    @param n: An integer
    @return: A list of strings.
    """
    def fizzBuzz(self, n):
        # write your code here
        return ["fizz buzz" if x % 15 == 0 else "fizz" if x % 3 == 0 else "buzz"
        if x % 5 == 0 else str(x) for x in range(1, 1+n)]

if __name__ == "__main__":
    n = 15
    sol = Solution()
    print(sol.fizzBuzz(n))