#!/bin/bash
# This file must be added to othe scripts like:  source dencrypt.sh
# and must be added: source encrypted_settings.cfg
# for decripting must write :  $(decrypt $user)



 function decrypt {}

# decryptedValue=$(decrypt $cryptedValue)

function decrypt {
if [ -n "$1" ]
then
    value_crypted_salt="$1"

    value_salt=$(echo "$value_crypted_salt" | base64 -d)

    # for length
    length=$(expr length "$value_salt")
    endSalt=$(($length-9))

    #Substring without salt only password
    value_encrypted=$(echo ${value_salt:5:endSalt})

    # second stage 
    value_salt2=$(echo "$value_encrypted" | base64 -d)

    # for length
    length2=$(expr length "$value_salt2")
    endSalt2=$(($length2-11))

    #Substring without salt only password
    value=$(echo ${value_salt2:3:endSalt2})

    echo "$value"
else
   echo " Enter settings encrypted variable"
fi

}



