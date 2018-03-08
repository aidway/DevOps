"""
    题目：8. Rotate String
    地址：http://www.lintcode.com/en/problem/rotate-string/
    算法：简单
    时间：20180308
"""


class Solution:
    """
    @param str: An array of char
    @param offset: An integer
    @return: nothing
    """
    def rotateString(self, str, offset):
        # write your code here
        str_len = len(str)
        offset = offset % str_len
        # return str[-offset:] + str[0:str_len-offset] if offset > 0 else str
        if offset > 0:
            return str[-offset:] + str[0:str_len-offset]
        else:
            print(offset)
            return str

if __name__ == "__main__":
    sol = Solution()
    print(sol.rotateString("abcdefg", 3))
