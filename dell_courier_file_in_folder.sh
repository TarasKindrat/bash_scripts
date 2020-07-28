#!/bin/bash
read -p "Will be deleting old Courier files y / n? " res
 
 case $res in
  y) 
if {
  find /var/vmail/name.domen.com/ -type f -name courierimapuiddb -exec rm -f {} \; 
  
   find /var/vmail/name.domen.com/ -type f -name courierimapacl -exec rm -f {} \;     
  
   find /var/vmail/name.domen.com/ -type f -name courierimapsubscribed -exec rm -f {} \;
  
   find /var/vmail/name.domen.com/ -type f -name courierpop3dsizelist -exec rm -f {} \;
  
   find /var/vmail/name.domen.com/ -type f -name maildirfolder -exec rm -f {} \;
  
   find /var/vmail/name.domen.com/ -type d -name courierimapkeywords -exec rm -Rf {} \;    
 
 }
  then echo " job done all is delitetd" 
  fi   ;;
   
   n)
 echo "Goodbye";;
    
    esac
