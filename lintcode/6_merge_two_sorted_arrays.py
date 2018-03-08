"""
    题目：6. Merge Two Sorted Arrays
    地址：http://www.lintcode.com/en/problem/merge-two-sorted-arrays/
    算法：模拟
    时间：20180307
"""


class Solution:
    """
    @param A: sorted integer array A
    @param B: sorted integer array B
    @return: A new sorted integer array
    """
    def mergeSortedArray(self, A, B):
        # write your code here
        i = j = 0
        len_a = len(A)
        len_b = len(B)
        c = []
        while i < len_a and j < len_b:
            if A[i] < B[j]:
                c.append(A[i])
                i += 1
            elif A[i] > B[j]:
                c.append(B[j])
                j += 1
            else:
                c.append(A[i])
                c.append(B[j])
                i += 1
                j += 1
        if i < len_a:
            c.extend(A[i:len_a])
        if j < len_b:
            c.extend(B[j:len_b])
        return c



A=[1,2,3,4]
B=[2,4,5,6]
sol = Solution()
print(sol.mergeSortedArray(A, B))


