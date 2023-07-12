#!/bin/bash

# list of zombie processes
zombies=$(ps aux | awk '{ if ($8 == "Z") { print $2 } }')

# Kill each zombie process
for zombie in $zombies; do
    echo "Killing zombie process: $zombie..."
    kill -s SIGCHLD $(ps -o ppid= -p $zombie)
done
