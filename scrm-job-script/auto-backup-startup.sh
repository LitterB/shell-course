#!/bin/bash

get_jar_name() {
    JAR_NAME=$(ls *.jar)
    if [ $(echo "$JAR_NAME" | wc -l) -gt 1 ]; then
        echo "[ERROR]: Multiple Runnable Jar File."
        exit 1
    elif [ "x$JAR_NAME" == "x" ]; then
        echo "[ERROR]: No Jar file found."
        exit 1
    fi
}

cur_data="`date +%Y%m%d`"
#get the current Jar file PID
get_jar_name
jar_name=${JAR_NAME}
backup_name=${jar_name}"_"${cur_data}
backup_dir="./bak"
process_id=$(ps -ef| grep ${jar_name} | grep -v "grep" | awk '{print $2}')
if [ -n "$process_id" ]
then
    echo "the PID is ${process_id}"
    echo "start to shutdown the process....."
    kill ${process_id}
    echo "shutdown success....."
    echo "start to backup ${jar_name}....."
    echo "backup_name is ${backup_name}"
else
    echo "could not find the process...." 
fi
#if current directory not have the bak directory,then we create it
if [ ! -d "${backup_dir}" ]
then
    mkdir "${backup_dir}"
fi
# copy the origin file to the backup directory
cp -r ${jar_name} ${backup_dir}/${backup_name}

