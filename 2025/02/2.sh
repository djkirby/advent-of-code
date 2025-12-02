#!/bin/bash

awk -v RS=',' -v FS='-' '{for(i=$1;i<=$2;i++)print i}' ./input | grep '^\([0-9]\+\)\1\+$' | awk '{n+=$1}END{print n}'
