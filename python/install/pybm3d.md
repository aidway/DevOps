# pybm3d github��ַ
https://github.com/ericmjonas/pybm3d

# ��װ����
## ����
centos7.6

## ��װlibfftw3
1. ����
http://www.fftw.org/download.html
2. ��װ
```shell
# ������װ(��ѡ)
[root@tdh01 tmp]# cd fftw-3.3.9/
[root@tdh01 fftw-3.3.9]# ./configure
[root@tdh01 fftw-3.3.9]# make
[root@tdh01 fftw-3.3.9]# make install
# ��װlfftw3(��ѡ)
[root@tdh01 fftw-3.3.9]# ./configure --enable-shared  
[root@tdh01 fftw-3.3.9]# make
[root@tdh01 fftw-3.3.9]# make install
[root@tdh01 fftw-3.3.9]# make clean
# ��װlfftw3l(��ѡ)
[root@tdh01 fftw-3.3.9]# ./configure --enable-shared --enable-single --enable-long-double  
[root@tdh01 fftw-3.3.9]# make
[root@tdh01 fftw-3.3.9]# make install
[root@tdh01 fftw-3.3.9]# make clean
[root@tdh01 fftw-3.3.9]# ./configure --enable-shared --enable-long-double  
[root@tdh01 fftw-3.3.9]# make
[root@tdh01 fftw-3.3.9]# make install
[root@tdh01 fftw-3.3.9]# make clean
# ��װlfftw3f(��ѡ)
[root@tdh01 fftw-3.3.9]# ./configure --enable-shared --enable-float  
[root@tdh01 fftw-3.3.9]# make
[root@tdh01 fftw-3.3.9]# make install
[root@tdh01 fftw-3.3.9]# make clean
# ���û�������
[root@tdh01 fftw-3.3.9]# export LD_LIBRARY_PATH=/usr/local/lib
[root@tdh01 fftw-3.3.9]# export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
```
## ��װpybm3d
```shell
[root@tdh01 fftw-3.3.9]# pip install pybm3d
```