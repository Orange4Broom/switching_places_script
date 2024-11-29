#!/bin/bash

# Get the current month and year
current_month=$(date +"%B")
current_year=$(date +"%Y")
current_month_number=$(date +"%m")

# Get the number of days in the current month
days_in_month=$(cal | awk 'NF {DAYS = $NF}; END {print DAYS}')

# Calculate the number of workdays (Monday to Friday)
workdays=0
for (( day=1; day<=$days_in_month; day++ ))
do
    day_of_week=$(gdate -d "$current_year-$current_month_number-$day" +%u 2>/dev/null)
    if [ $? -eq 0 ] && [ $day_of_week -lt 6 ]; then
        workdays=$((workdays + 1))
    fi
done

# Calculate the total work hours (assuming 8 hours per workday)
work_hours=$((workdays * 8))

# Print the results with color highlighting
echo -e "\033[1;34mCurrent month:\033[0m \033[1;32m$current_month\033[0m"
echo -e "\033[1;34mWork days:\033[0m \033[1;32m$workdays days\033[0m"
echo -e "\033[1;34mWork hours:\033[0m \033[1;32m$work_hours hours\033[0m"
