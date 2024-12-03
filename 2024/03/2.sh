#!/bin/bash

grep -o "mul(\d\+,\d\+)\|do()\|don't()" ./input \
    | awk -F'[(,)]' '/n/{x = 1; next}/d/{x = 0}{t += $2 * $3 * !x}END{print t}'
