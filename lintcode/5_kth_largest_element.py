"""
    题目：5.Find K-th largest element in an array
    地址：http://www.lintcode.com/en/problem/kth-largest-element/
    算法：利用快速排序思想，不断对数组进行划分
    时间：20180307
"""


class Solution:
    num = list()

    # @param k & A a integer and an array
    # @return ans a integer
    def kthLargestElement(self, k, A):
        self.num = A
        return self.find_kth_largest_element(k, 0, len(self.num)-1)

    def find_kth_largest_element(self, k, start, end):
        if start == end:
            return self.num[start]
        index = self.partition(start, end)
        if end - index + 1 == k:
            return self.num[index]
        elif end - index + 1 > k:
            return self.find_kth_largest_element(k, index+1, end)
        else:
            return self.find_kth_largest_element(k-(end-index+1), start, index-1)

    def partition(self, start, end):
        mid = int((start + end) / 2)
        self.swap(mid, start)
        # (i,j) 大于num[start]的列表范围
        i = j = start + 1
        while i <= end and j <= end:
            if self.num[j] < self.num[start]:
                self.swap(i, j)
                i += 1
            j += 1
        self.swap(i-1, start)
        return i - 1

    def swap(self, i, j):
        temp = self.num[i]
        self.num[i] = self.num[j]
        self.num[j] = temp

if __name__ == "__main__":
    sol = Solution()
    # print(sol.kthLargestElement(k, A))
