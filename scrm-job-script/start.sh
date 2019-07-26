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

get_jar_name
nohup java -jar ${JAR_NAME} &