#!/bin/bash
KEY=$(grep -e "^KEY=" .env | cut -d '=' -f 2)
tr "$KEY" 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' | tr '[:upper:]' '[:lower:]'