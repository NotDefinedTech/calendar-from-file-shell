#!/bin/bash

# To control current year
current_year=$(date | awk '{print $NF}')
dates=$(sed -n "s/.*\($current_year-[0-9]\{2\}-[0-9]\{2\}\).*/\1/p" data/report.txt | sort)

# --OR-- get any dates regardless of year:
# dates=$(sed -n 's/.*\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/p' data/report.txt | sort)

# echo $dates

for date in $dates; do
    # pull out year, month, day if needed
    # year=$(echo $date | cut -d- -f1)
    month=$(echo $date | cut -d- -f2)
    # day=$(echo $date | cut -d- -f3)

    cal -m $month -H $date
done
