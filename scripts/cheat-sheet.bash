#!/usr/bin/env bash

read -p "Enter cht.sh Query: " query

curl -s "cht.sh/$query" | less -r

