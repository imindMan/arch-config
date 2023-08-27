#!/bin/bash

# Set the path to the folder containing the files
folder_path="/home/dev-vons/.config/bspwm/ascii-collections/"

# Use find to get a list of files in the folder and shuf to randomly select one
random_file=$(find "$folder_path" -type f | shuf -n 1)

# Use cat to display the contents of the randomly selected file
cat "$random_file"

