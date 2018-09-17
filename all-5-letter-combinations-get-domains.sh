DOMAINS=( '.com' )

while read p; do
  domain=$(echo $p | tr '[:upper:]' '[:lower:]')
  if [ -z `echo $domain | tr -d "[:alnum:]"` ]; then
    whois $domain${DOMAINS[${i}]} | egrep -q \
    '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri'
    if [ $? -eq 0 ]; then
      echo "$domain${DOMAINS[${i}]} : available" | tee -a all-5-letter-combinations-available.txt
    else
      echo "$domain${DOMAINS[${i}]} : nope"
    fi
  else
    echo "$domain${DOMAINS[${i}]} : contains dodgy characters"
  fi
done <all-5-letter-combinations.txt
