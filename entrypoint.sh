#!/bin/bash

searchDomain=$1
_show_=$(pwd && ls -la)
echo $_show_

echo "+------------------------------chmod--------------------------------+"

chmod +x chrome-linux/chrome && file chrome-linux/chrome

function _gather_domains_() {
    echo "+------------------------------domain--------------------------------+"
    echo $_show_
    python3 -m pip install -r requirement.txt
    python3 brutedns.py -s high -d $searchDomain -l 4
    echo $_show_
    awk -F"," 'NR == 1 {next} {print $1}' result/$searchDomain/$searchDomain.csv > $searchDomain-output.txt
    echo "+------------------------------dm end--------------------------------+"
}

function _discover_DomainInfo_() {
    echo "+-----------------------------dm INF--------------------------------+"
    echo $_show_
#nmap -p- -v -sV -iL $searchDomain-output.txt -oX $searchDomain-output.xml
    echo "+----------------------------dmF END--------------------------------+"
}
#function aquatone(){
#
#echo "Hello $1"
#cat $1-output.xml | ./aquatone/aquatone -chrome-path chrome-linux/chrome -nmap -out $1-html-output
#ls $1-html-output
#
#zip html-output.zip -r html-output/*
#}
_gather_domains_
_discover_DomainInfo_




