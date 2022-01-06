#!/bin/bash
source ./functions/color_print_fun.sh

# cd /tmp && pwd
# echo "hello guys!"
# chmod +x chrome-linux/chrome && file chrome-linux/chrome


# here to check paragram $searchDomain is valid or not.
function _domain_checkValid_(){
# check domain format code: visit https://blog.csdn.net/lyl001234/article/details/111326124
# grep to check input domain valid or not
echo $searchDomain | grep -P "^(?=^.{3,255}$)[a-zA-Z0-9\p{Han}][-a-zA-Z0-9\p{Han}]{0,62}(\.[a-zA-Z0-9\p{Han}][-a-zA-Z0-9\p{Han}]{0,62})+$"
domain_bool_valid=`echo $?`

if [ $domain_bool_valid = "0" ] ; then
	underline_info_show "here is right domain format."
else
	underline_critical_show "[FATAL]: Domain you in put is invalid."
	exit 0
fi

# done.
}

function _gather_domains_() {
    echo "+------------------------------domain--------------------------------+"
    echo $_show_
    python3 -m pip install -r requirement.txt
    # start to collect clid domains.
    python3 brutedns.py -s high -d $searchDomain -l 4
    sleep 1
    awk -F"," 'NR == 1 {next} {print $1}' result/$searchDomain/$searchDomain.csv > $searchDomain-output.txt
    ls -la $searchDomain-output.txt
    echo "+------------------------------dm end--------------------------------+"
}

function _discover_domainInfo_() {
    echo "+-----------------------------dm INF--------------------------------+"
    echo $_show_
    echo "ready to scan."
    tar -zxvf nmap_bin.tar.gz &>/dev/null
    cd nmap_bin && chmod +x script.sh && ./script.sh nmap -p- -v -sV -iL ../$searchDomain-output.txt -oX ../$searchDomain-output.xml
    ls -la $searchDomain-output.xml
    echo "+----------------------------dmF END--------------------------------+"
}

function _aquatone_domainInfo_screens_(){
    chmod +x 7zzs && ./7zzs x chrome-linux.7z &>/dev/null
    #tar -zxvf chrome-linux.tar.gz
    #ls -la chrome-linux
    chmod +x chrome-linux/chrome && file chrome-linux/chrome
    cat $searchDomain-output.xml | ./aquatone/aquatone -chrome-path chrome-linux/chrome -nmap -out $searchDomain-html-output && tar -czf attachments.tar.gz $searchDomain-html-output
}

function _telescope_usage_(){
	echo "im thinking: im jump to telescope_usage func now."
	exit 0
}


# define some glabol case.
# searchDomain=$1
_show_=$(pwd && ls -la)
# done.

##
# TODO:
# 1.set $1/$searchDomain into github action env. not to type in 3 times while run scripts 3 way.
# 2.test in action. [2022/01/01/23:18:26 CST]
# 3.use color_print_fun.sh glabolly.
# 4.function _domain_checkValid_() are in bug while program running, need to fix it.
##

# judgement: while script file running:
# check input paragram is null or not;
# or:
# check $searchDomain valid or not.

#if [ "$#" -eq 0 ] || _domain_checkValid_ ; then
if [ "$#" -eq 0 ] ; then
    _telescope_usage_
    exit 0
fi

# some cases to check what function to transfer.
case $1 in
    domains )
        _gather_domains_
        #echo "im in case: domains"
        ;;
    ports )
        _discover_domainInfo_
        #echo "im in case: reset_used"
        ;;
    screens )
        #echo "im in case: screens"
        _aquatone_domainInfo_screens_
        ;;
    * )
        _telescope_usage_
        ;;
esac