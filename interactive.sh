#!/bin/bash
dict=$(cat .var/dict)
url=$(cat .var/url)

printf "\nInteractive script for WXP \nFirst of all you need to select file with dict, and then URL.\n"
printf "\n ! Options information ! \n   - Dictionary: $dict\n   - URL: $url\n\n"

echo "0) Select file & URL"
echo "1) Start scan, and show only success URI"
echo "2) Save all logs in file"
echo "3) Start async script for multi-scanning"

function env() {
  read -p "$: " option
  
  case $option in
    "0")
      read -p "Input pathway to file with dictionary: " dict
      read -p "Input URL address: " url
      echo $url - URL
      echo $dict - Dictionary
      read -p "Thats right?: y/N " question
      if [[ question -eq 'y' ]]; then
        echo $dict > .var/dict
        echo $url > .var/url
        printf "\nDone, information saved\n"
      fi
      ;;
    "1")
      python3 ./wxp.py $dict $url | grep -iE ^[0-3]
      ;;
    "2")
      python3 ./wxp.py $dict $url > logs.dat
      echo "Done !"
      ;;
    "3") 
      echo "soon"
      ;;
    *)
      echo "? .-."
  esac
}

while [[ true ]]; 
do
  env
done
