DOMAINS=( '.com' )

echo '<table>' | tee short-domain-names-dictionary-words.html

while read p; do
  domain=$(echo $p | tr '[:upper:]' '[:lower:]')
  if [ -z `echo $domain | tr -d "[:alnum:]"` ]; then
    domain_name=$domain${DOMAINS[${i}]}
    whois $domain_name | egrep -q \
    '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri'
    if [ $? -eq 0 ]; then
      echo '<tr><td>$domain${DOMAINS[${i}]}</td><td><a href="https://www.namecheap.com/domains/registration/results.aspx?domain=$domain${DOMAINS[${i}]}">BUY</a></td></tr>' | tee -a dictionary-words-available.md
    else
      echo "$domain${DOMAINS[${i}]} : Not Available"
    fi
  else
    echo "$domain${DOMAINS[${i}]} : contains dodgy characters"
  fi
done <dictionary-words.txt

echo '</table>' | tee -a dictionary-words-available.md
