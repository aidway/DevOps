## conda�汾
4.7.12

## ����
��A������������������conda����ocrǨ�Ƶ�B���������߻�������������������

## ����
1.��A������anaconda3/envs/ocrĿ¼������ B������/tmp/Ŀ¼  
2.��A������anaconda3/pkgs���ļ������� B������anaconda3/pkgs/Ŀ¼  
3.��B����anaconda3/pkgs/�е�urls��urls.txtɾ��  
4.B����  
```shell
conda create -n ocr --clone /tmp/ocr --offline
```

## ����
1.could not parse explicit url  
V4.6.14��֪bug  
https://github.com/conda/conda/issues/9272  
2.RuntimeError ...using a remote connection in offline mode  
�����������������޸�Ϊ��  
```shell
conda create -n ocr --clone /tmp/ocr
```
3.conda activate���������CommandNotFoundError: Your shell has not been properly configured  
ִ���������  
```shell
source activate ocr
```
