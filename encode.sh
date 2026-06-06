#!/bin/bash

KEY=$(grep -e "^KEY=" .env | cut -d '=' -f 2)

tr '[:lower:]' '[:upper:]' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' "$KEY"