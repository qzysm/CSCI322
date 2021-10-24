# 1
grep -o -I ‘POST’ NASA_access_log_Aug95.txt | wc -l
# 2
grep '[A-Za-z0-9].[A-Za-z0-9].nasa.gov' NASA_access_log_Aug95.txt | grep '/history/skylab/flight-summary.txt' | grep 'GET' | awk '{print $1, $4, $5}' | tail -1
# 3
grep -o '/elv/[A-Z]*' NASA_access_log_Aug95.txt | awk -F'/' '{print $3}' | sort -u | grep -v -e '^$' > elv.txt