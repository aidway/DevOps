```
python3

'''
cv2.imread�Ķ�ȡ˳����BGR����plt.imshow��˳����RGB����ͨ���������ַ�ʽת����
'''

# 1. ͼ��ת��
img = cv2.imread("./imgs/test2-1.png")
img = cv2.cvtColor(img,cv2.COLOR_BGR2RGB)
plt.imshow(img)


# 2. ������ʾ˳��
img = cv2.imread("./imgs/test2-1.png")[:,:,[2,1,0]]
plt.imshow(img)


# 3. �ٷ��ֶ�
img = cv2.imread("./imgs/test2-1.png")[...,::-1]
plt.imshow(img)

# 4. ���ԭͼ�ǻҶ�ͼ
plt.imshow(img, cmap=plt.cm.gray)

```