#!/bin/bash

grep -o 'mul(\d\+,\d\+)' ./input \
    | awk -F'[(,)]' '{t += $2 * $3}END{print t}'
