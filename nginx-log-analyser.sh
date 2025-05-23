#!/bin/bash

log_file="nginx-access.log"

five_most_used_ip=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -r | head -5)

echo "Top 5 IP addresses with the most requests:"
echo "$five_most_used_ip" | awk '{print $2 " - " $1 " requests"}'

echo

five_most_paths=$(awk '{print $7}' "$log_file" | sort | uniq -c | sort -r | head -5)
echo "Top 5 most requested paths:"
echo "$five_most_paths" | awk '{print $2 " - " $1 " requests"}'

echo

five_most_codes=$(awk '$9 ~ /^[0-9]{3}$/ {print $9}' nginx-access.log | sort | uniq -c | sort -nr | head -5)
echo "Top 5 response status codes:"
echo "$five_most_codes" | awk '{print $2 " - " $1 " requests"}'
