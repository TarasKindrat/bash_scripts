#! bin/bash 

cd /var/log
 
find . -type f -name "*" -print |
  while read file
 do

	if [ $(grep -irnw 'error|warn' $file | wc -l) -gt 0 ] # chek if is some errore or warn in file

            then
      printf "\n" >> /home/taras/scripts/errors.txt
      
              echo $file >> /home/taras/scripts/errors.txt
      
              echo "===================">> /home/taras/scripts/errors.txt
      
              grep -inwC 3 error $file >> /home/taras/scripts/errors.txt 
      
              echo "===================">> /home/taras/scripts/errors.txt
      
              echo `date +%H:%M:%S`  >> /home/taras/scripts/errors.txt
     
              printf '\n' >> //home/taras/scripts/errors.txt
    
           fi

  done

