#!/bin/bash
export KOB_SERVICE="raw.githubusercontent.com"
KOB_NAMESPACE="asa1997"
VERSION="taga8"
echo "KOB-EMAIL-VERIFICATION-SERVICE"
[[ -d $HOME/KOB-email-verification-service ]] && echo "Service already found at $HOME/KOB-email-verification-service" && exit 0
mkdir -p $HOME/KOB-email-verification-service
echo "Downloading necessary files..."
curl -sL --location --progress-bar "${KOB_SERVICE}/${KOB_NAMESPACE}/KOB-email-verification/dist/dist/kob-email-latest.zip" > $HOME/kob-email.zip
[[ "$?" != "0" ]] && echo "Something went wrong" && rm -rf $HOME/KOB-email-verification-service && exit 0
echo "Unpacking files...."
unzip -q $HOME/kob-email.zip -d $HOME/KOB-email-verification-service
if [[ "$?" == "0" ]]; then
    echo "Success"
else
    echo "Failed unpacking files. Try again later."
fi
[[ -f $HOME/kob-email.zip ]] && rm $HOME/kob-email.zip
