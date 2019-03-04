#! bin/bash

cd /home/taras/20files 
for file in *
  do
   echo $file;
done
   tar -cvzf files.tar.gz *
# detele files.tar.gz olde 30 minutes  (-mmin +30 it is -mtime in minutes)
find files.tar.gz -mmin +30 -exec rm -rf {} \;


