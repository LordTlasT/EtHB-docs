#!/bin/sh
scp "${1:-features.html}" spacehb:/var/www/html/"${1:-index.html}"
