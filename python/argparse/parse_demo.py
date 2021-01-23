import argparse

def parse_args():
    parser = argparse.ArgumentParser()
    
    parser.add_argument("--username", type=str, default='guest')
    parser.add_argument("--password", type=str, default='123456')
    
    return parser.parse_args()
    
if __name__ == '__main__':
    username=parse_args().username
    password=parse_args().password
    print('username:',username)
    print('password:',password)