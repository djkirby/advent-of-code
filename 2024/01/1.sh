#!/bin/bash

paste <(sort -n input) <(sort -k2n input) | awk '{t += $4 - $1 > 0 ? $4 - $1 : $1 - $4}END{print t}'
