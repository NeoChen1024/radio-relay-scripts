#!/usr/bin/env zsh
alias ctl="rigctl -m 4"

time="$(date +"%H%M%S")"
echo "TIME=${time}"

if grep "^$time" schedule.list > /ram/sch.list; then
	freq="$(cut -f 2 -d $'\t' < /ram/sch.list)"
	mode="$(cut -f 3 -d $'\t' < /ram/sch.list)"
	bw="$(cut -f 4 -d $'\t' < /ram/sch.list)"
	
	echo "$time: $freq, $mode, $bw" >> /ram/set.txt
	ctrl V VFOA
	ctl F "${freq}" M "$mode" "$bw" V VFOA
fi

ctl f m
