#!/bin/bash
source encrypt_settings.cfg

# function decrypt {}

# decryptedValue=$(decrypt $cryptedValue) 

function decrypt {
if [ -n "$1" ]
then 
    value_crypted_salt="$1" 


    value_salt=$(echo "$value_crypted_salt" | base64 -d)
#    echo $DB_PASSWORD_SALT

    # for length
    length=$(expr length "$value_salt")
#    echo "length is $length"
    endSalt=$(($length-9))

    #Substring without salt only password
    value_encrypted=$(echo ${value_salt:5:endSalt})

    echo "$value_encrypted"


    value_salt2=$(echo "$value_encrypted" | base64 -d)
#    echo $DB_PASSWORD_SALT

    # for length
    length2=$(expr length "$value_salt2")
#    echo "length is $length2"
    endSalt2=$(($length2-11))

    #Substring without salt only password
    value=$(echo ${value_salt2:3:endSalt2})

    echo "$value"




else 
   echo " Enter settings encrypted variable"
fi 

}

 
     decrypt "$password"
     decrypt "$mongopass"
     decrypt "$mu"      
     decrypt "$mp"
     decrypt "$mongouser"
