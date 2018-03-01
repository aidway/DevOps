#!/bin/sh

INCEPTOR_SERVER=host1
DEFAULT_DB=fdm


STTY_RESTORE=$(stty -g)  

echo  -n "Enter user-name:"
read username
echo -n "Enter password:"
stty -echo cbreak  
while true  
do  
        character=$(dd if=/dev/tty bs=1 count=1 2> /dev/null)  
        case $character in  
        $(echo -e "\n"))  
                break  
                ;;  
        $(echo -e "\b"))  
                if [ -n "$password" ]; then  
                        echo -n -e "\b \b"  
                        password=$(echo "$password" | sed 's/.$//g')  
                fi  
                ;;  
        *)  
                password=$password$character  
                echo -n '*'  
                ;;  
        esac  
done  
stty $STTY_RESTORE   


echo ""
echo -n  "Enter database-name(default is fdm):"
read dbname

if [ "$dbname" = "" ];then
    dbname=$DEFAULT_DB
fi

beeline -u jdbc:hive2://$INCEPTOR_SERVER:10000/$dbname -n $username -p $password