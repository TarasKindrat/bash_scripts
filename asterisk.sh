# Copy audio recotds from asterisk server to windows Share folder
#!/bin/bash
read -p "Uvedit datu rozmovi napriklad 1021  dlya poshuku " date
read -p "Uvedit nomer telefonu dlya poshuku " number

# count how many files is found and test that number  (Count the number of lines output wc -l)
if [  $(find /asterisk/records/tvnet  -type f -name "*$date*$number*"| wc -l) -gt 0 ]
   then
   mkdir -pvm 755 $number/
   find /asterisk/records/tvnet  -type f -name "*$date*$number*" | xargs cp -t /search_records/$number/    # find and copy files
   echo " files are copied in folder"

   cd $number                           # rename files, chench ":" to "_" in names, windows can't save name whis ":"    
   echo "Cheng simvol : to _ "
   #rename -v 's/:/_/' *wav
   #rename -v 's/:/_/' *wav
   sed 's/:/_/g' *wav
   cd ..

   echo " mount at NAS/Asteriskrecords/"
   sudo mount -t cifs //192.168.1.6/share/asteriskRecords /search_records/mnt/share -o username=user,password="password"

   echo " Copy files "
   sudo cp -r $number mnt/share
   echo "Finish copy"
   sudo umount  /search_records/mnt/share
   echo "Job is done!"
else echo "faila ne znaydeno"
fi
























