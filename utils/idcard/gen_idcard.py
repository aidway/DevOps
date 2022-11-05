from PIL import Image, ImageDraw, ImageFont
import numpy as np
import cv2
import random

 
# ����д�ֺ���
def add_txt(image, size, draw_x, draw_y, txt):
    # �����ֺ�
    setFont = ImageFont.truetype('/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc', size)
    # ���廭��
    draw = ImageDraw.Draw(image)
    # ����
    draw.text((draw_x, draw_y), txt,   font=setFont, fill=(0, 0, 0)) #
    return image
 
 
 
def make_white_mask(img_idx, card_no):
    # ����һ���հ׵�ģ��mask
    ori_image = cv2.imread(CARD_SAMPLE_PATH)
    ori_image = cv2.resize(ori_image, (0, 0), fx=0.4, fy=0.4)
    mask_image = np.ones_like(ori_image)
    mask_image *= 255
#     print(mask_image.shape)
    cv2.imwrite(BASE_PATH+'mask.jpg', mask_image)
 
    # ���հ�ģ����д��(����ֻ����PILд����ΪOpenCVд���Ļ�����)
    img = Image.fromarray(cv2.cvtColor(mask_image, cv2.COLOR_BGR2RGB))
    img = add_txt(img, 16, 90, 55, '�ֵ���')
    img = add_txt(img, 16, 90, 87, 'Ů')
    img = add_txt(img, 16, 190, 87, '��')
    img = add_txt(img, 16, 90, 116, '2020')
    img = add_txt(img, 16, 160, 116, '2')
    img = add_txt(img, 16, 200, 116, '26')
    img = add_txt(img, 16, 90, 151, '������')
    img = add_txt(img, 16, 90, 172, '��606')
    img = add_txt(img, 16, 142, 235, str(card_no))
 
    mask_image_txt = cv2.cvtColor(np.array(img), cv2.COLOR_RGB2BGR)
    cv2.imwrite(BASE_PATH+'mask_image_txt.jpg', mask_image_txt)
    gray = cv2.cvtColor(mask_image_txt, cv2.COLOR_BGR2GRAY)
    # ��˹ģ���������Եģ��Ч��Ŷ
    gray_Gaussianblur = cv2.GaussianBlur(gray, (3, 3), 0)
 
    # ʹ����ֵ��ͼƬ���ж�ֵ��
    th, res = cv2.threshold(gray_Gaussianblur, 200, 255, cv2.THRESH_BINARY)
    res_inv = cv2.bitwise_not(res)
#     cv2.imwrite(BASE_PATH+'res_inv.jpg', res_inv)
 
    # д�ֵ�ģ�屣�����ֲ���
    img_bg = cv2.bitwise_and(mask_image_txt, mask_image_txt, mask=res_inv)
#     cv2.imwrite(BASE_PATH+'img_bg.jpg', img_bg)
    # ԭͼ���������ֵ���������
    img_fg = cv2.bitwise_and(ori_image, ori_image, mask=res)
#     cv2.imwrite(BASE_PATH+'img_fg.jpg', img_fg)
    # ������ͼֱ�ӽ�����ӣ�����
    final = cv2.add(img_bg, img_fg)
    cv2.imwrite(BASE_PATH+'idcard'+str(img_idx)+'.jpg', final)
    
  

class IdNumber(str):
    def __init__(self, id_number):
        super(IdNumber, self).__init__()
        self.id = id_number

    def get_check_digit(self):
        """ͨ�����֤�Ż�ȡУ����"""
        check_sum = 0
        for i in range(0, 17):
            check_sum += ((1 << (17 - i)) % 11) * int(self.id[i])
        check_digit = (12 - (check_sum % 11)) % 11
        return check_digit if check_digit < 10 else "X"

    @classmethod
    def generate_myid(cls):
        generate_ids = []
        
        # ˳����(2λ��)
        for i in range(100):
            sort_no = f"{i:02d}"
            for j in [x for x in range(10) if x % 2 != 0]:
                # �������һ��������(6λ��)
                area_code = str(random.randint(371326,412826))
                # �޶��������ڷ�Χ(8λ��)
                birth_day = str(random.randint(1949,2000))+str(random.randint(1,12)).rjust(2,'0')+str(random.randint(1,28)).rjust(2,'0')

#                 print(j)
                sex = j
                prefix = f"{area_code}{birth_day}{sort_no}{sex}"
                valid_bit = str(cls(prefix).get_check_digit())
                generate_ids.append(f"{prefix}{valid_bit}")
        return generate_ids

 
 
if __name__ == '__main__':
    BASE_PATH='/home/transwarp/kwq/script/jupyter/jupyter_files/101_OCR/imgs/idcards/'
    CARD_SAMPLE_PATH='./imgs/03/card_sample.png'
    generate_ids = IdNumber.generate_myid()
    for idx in range(len(generate_ids)):
        make_white_mask(idx+1, generate_ids[idx])      
        
 
 
 