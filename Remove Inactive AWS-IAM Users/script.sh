#!/bin/bash

FILE=status_reports_2018-03-27T03-01-45+00-00.csv
TODAYS_DATE=$(date +'%Y-%m-%d')
count=1
LIMIT_PERIOD=30

while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ $(echo $line | cut -d ',' -f1) != "<root_account>" && $count != 1 ]]
		then
			last_used_date1=$(echo $line | cut -d ',' -f11 | cut -c1-10 )
			last_used_date2=$(echo $line | cut -d ',' -f16 | cut -c1-10 )
			days_diff1=0
			days_diff2=0
			if [[ $last_used_date1 != "N/A" ]] 
				then
					days_diff1=$(echo $(($(($(date -d $TODAYS_DATE "+%s") - $(date -d $last_used_date1 "+%s"))) / 86400)))
			fi

			if [[ $last_used_date2 != "N/A" ]] 
				then
					days_diff2=$(echo $(($(($(date -d $TODAYS_DATE "+%s") - $(date -d $last_used_date2 "+%s"))) / 86400)))
			fi
			
			if [[ $days_diff1 > $LIMIT_PERIOD || $days_diff2 > $LIMIT_PERIOD ]] 
				then
					user_name=$(echo $line | cut -d ',' -f1)
					if [[ -z "$(aws iam list-users | grep $user_name)" ]]
						then
							echo "USER_NAME: $user_name does not exists"
					else
						echo "DELETING : USER_NAME: $user_name"
						aws iam delete-user --user-name $user_name
					fi
			fi
	fi
	count=$((count + 1))
done < $FILE