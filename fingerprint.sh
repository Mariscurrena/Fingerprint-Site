#!/usr/bin/env bash
##By Angel Mariscurrena
##Repo: https://github.com/Mariscurrena/Hash-Validator.git
clear

loading(){
    loading_chars="/ - \\ |"
    duration=3
    interval=0.1
    end_time=$((SECONDS + duration))
    while [ $SECONDS -lt $end_time ]; do
        for char in $loading_chars; do
            echo -ne "\rLoading... $char"
            sleep $interval
        done
    done
}

fingerprint(){
    output=$(whatweb $1)
    sleep 1
    echo "$output" | tr ',' '\n' > fingerprint.txt
}

while getopts :s: option; do
        case $option in
            s) 
                loading
                fingerprint $OPTARG
                echo ""
                echo "Fingerprint file for "$OPTARG" web site was created successfully"
	        echo "File Location is $(pwd)/fingerprint.txt"
            ;;
            ?) echo "Option Unknown: "$OPTARG""
        esac
done
