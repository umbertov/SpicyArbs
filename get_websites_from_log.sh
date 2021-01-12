grep -E 'on website \w+ at odds' log -o | awk -F' ' '{print $3; if ($4 != "at") print " " $4}' > /tmp/asd

python <<EOF
from collections import Counter
c = Counter([line.strip() for line in open('/tmp/asd')])
print('Sito\tConteggio')
for website, count in c.items():
    print(f'{website}\t{count}')
EOF
