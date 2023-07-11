#!/bin/bash

# Obtener una lista de todos los procesos zombie
zombies=$(ps aux | awk '{ if ($8 == "Z") { print $2 } }')

# Matar cada proceso zombie
for zombie in $zombies; do
    echo "Matando proceso zombie $zombie..."
    kill -s SIGCHLD $(ps -o ppid= -p $zombie)
done
