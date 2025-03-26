#!/bin/bash
url=`grep "JENKINS_URL" jenkins.conf|cut -d "=" -f2`
user=`grep "JENKINS_USER" jenkins.conf|cut -d "=" -f2`
token=`grep "JENKINS_TOKEN" jenkins.conf|cut -d "=" -f2`
jar="java -jar jenkins-cli.jar -s $url -auth $user:$token"
echo "enter command to perform:"
echo "-----------------------"
echo "1) list_jobs"
echo "2) build_job"
echo "3) create_job"
echo "4) get_job"
echo "5) delete_job"
echo "=========================================="
read option
echo "=========================================="
if [[ $option == "list-jobs" ]]
then
$jar $option
elif [[ $option == "build" ]]
then
$jar list-jobs
echo "=========================================="
echo "enter the job_name:"
read job
$jar $option $job
elif [[ $option == "create-job" ]]
then
echo "NOTE: If your creating a job you must have a user XML file"
echo "enter the job_name:"
read job
$jar $option $job < pro.xml
elif [[ $option == "get-job" ]]
then
$jar list-jobs
echo "=========================================="
echo "enter the job_name to get:"
read job
$jar $option $job >$job.xml
if [[ echo$? -eq 0 ]]
then
echo " $job downloaded successfully"
fi
elif [[ $option == "delete-job" ]]
then
$jar list-jobs
echo "=========================================="
echo "enter the job_name to delete:"
read job
$jar $option $job
else
echo "$option:command not found"
fi

