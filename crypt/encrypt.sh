#!/bin/bash


# To encrypt, you must specify a settings file when running the script    "./encrypt.sh settings.cfg"
#fields have to be in the form
# user="wawald"
# password="dlivadvia"

function encrypt {

settings="$1"

# Get stdin from settings file
exec 0<"$settings"

while read line
   do
# Check if line are not empty
   if [ -n "$line" ]
     then
         variable=$(echo "$line" | awk -F"=" '{print $1}')
         value=$(echo "$line" | awk -F"=" '{print $2}')

         firstSalt=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 3 ; echo '')
         secondSalt=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8 ; echo '')

        # Add salt
        encryptedValue=$(echo "$firstSalt$value$secondSalt" | openssl enc -base64)

        firstSalt2=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 5 ; echo '')
        secondSalt2=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 4 ; echo '')

        # Add second salt
         encryptedValue2=$(echo "$firstSalt2$encryptedValue$secondSalt2" | openssl enc -base64 | tr -d "\n")
         echo "$encryptedValue2\n"  
         echo ""
        echo "$variable=$encryptedValue2" | tr -d "\n"  >>  encrypt_settings.cfg
        
     else
       # add line to file
       echo "$line" >> encrypt_settings.cfg
   fi
done
}

# Get settings file 
if [ -n "$1" ]
then 
    encrypt "$1"
else 
   echo " Enter settings file"
fi 

