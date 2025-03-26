#!/bin/bashi
url=`grep "JENKINS_URL" jenkins.conf|cut -d "=" -f2`
user=`grep "JENKINS_USER" jenkins.conf|cut -d "=" -f2`
token=`grep "JENKINS_TOKEN" jenkins.conf|cut -d "=" -f2`

echo "listing all jobs"
echo "----------------"
java -jar jenkins-cli.jar -s $url -auth $user:$token list-jobs 
