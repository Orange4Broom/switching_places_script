#!/bin/bash

# Získání aktuálního datumu, měsíce a roku
current_day=$(date +"%-d")
current_month=$(date +"%B")
current_year=$(date +"%Y")
current_month_number=$(date +"%-m")

# Získání počtu dní v aktuálním měsíci
days_in_month=$(cal | awk 'NF {DAYS = $NF}; END {print DAYS}')

# Vypočet počtu pracovních dní (pondělí až pátek) od začátku měsíce do aktuálního dne
workdays_to_current_day=0
for (( day=1; day<=$current_day; day++ ))
do
    day_of_week=$(date -j -f "%Y-%m-%d" "$current_year-$current_month_number-$day" +%u)
    if [ $day_of_week -lt 6 ]; then
        workdays_to_current_day=$((workdays_to_current_day + 1))
    fi
done

# Vypočet početu pracovních dní od aktuálního dne do konce měsíce
workdays_remaining=0
for (( day=current_day+1; day<=$days_in_month; day++ ))
do
    day_of_week=$(date -j -f "%Y-%m-%d" "$current_year-$current_month_number-$day" +%u)
    if [ $day_of_week -lt 6 ]; then
        workdays_remaining=$((workdays_remaining + 1))
    fi
done

# Vypočet celkového početu pracovních hodin (předpokládá se 8 hodin na pracovní den)
work_hours_to_current_day=$((workdays_to_current_day * 8))
work_hours_remaining=$((workdays_remaining * 8))

# Vypočet celkového početu pracovních hodin za celý měsíc
total_workdays=$((workdays_to_current_day + workdays_remaining))
total_work_hours=$((total_workdays * 8))

# Získání jména a emailu git uživatele
git_user_name=$(git config --list | grep 'user.name' | cut -d '=' -f 2)
git_user_email=$(git config --list | grep 'user.email' | cut -d '=' -f 2)

# Výpis výsledků s vylepšeným formátováním
echo -e "\033[1;34m================================================\033[0m"
echo -e "\033[1;34m|             Monthly Work Hours Report        |\033[0m"
echo -e "\033[1;34m================================================\033[0m"
echo -e "\033[1;34mMonth:\033[0m \033[1;32m$current_month $current_year\033[0m \033[1;34m| Day:\033[0m \033[1;32m$current_day\033[0m"
echo -e "\033[1;34mUp to Now:\033[0m \033[1;32m$workdays_to_current_day days, $work_hours_to_current_day hrs\033[0m"
echo -e "\033[1;34mRemaining:\033[0m \033[1;32m$workdays_remaining days, $work_hours_remaining hrs\033[0m"
echo -e "\033[1;34mTotal:\033[0m \033[1;32m$total_workdays days, $total_work_hours hrs\033[0m"
echo -e "\033[1;34m================================================\033[0m"
echo -e "\033[1;34mGit User:\033[0m \033[1;32m$git_user_name <$git_user_email>\033[0m"
echo -e "\033[1;34m================================================\033[0m"
