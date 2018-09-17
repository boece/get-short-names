from datetime import datetime
import whois

startTime = datetime.now()

filepath = "all-5-letter-combinations.txt"

num_lines = sum(1 for line in open(filepath))

domain = "com"


with open(filepath) as f:
    content = f.read().splitlines()
    for line in content:
        url =  ".".join([line, domain])
        print url
        whois_result = whois.whois(url)
        print whois_result


#Python 2:
print datetime.now() - startTime
