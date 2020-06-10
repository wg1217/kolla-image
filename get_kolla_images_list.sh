#!/bin/bash
git clone https://github.com/openstack/kolla.git

first_index=($(ls -l kolla/docker | grep "^d" | awk '{print $NF}'))

function get_kolla_image(){
  for first_file in ${first_index[@]}
    do
    #check if subdirectory exits
    second_files=($(ls -l kolla/docker/$first_file | grep "^d" | awk '{print $NF}'))
    if [ ${#second_files[@]} -eq 0 ]
    then
      echo $first_file >> images.txt
    else
      for second_file in ${second_files[@]}
      do
        echo $second_file >> images.txt
      done
    fi
  done
}
get_kolla_image
