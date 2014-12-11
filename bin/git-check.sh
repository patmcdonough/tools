#!/bin/sh


find . -name .git \
	-execdir echo "________________________________" \; \
	-execdir pwd \; \
       	-execdir git fetch --all \; \
	-execdir git log --branches --not --remotes --simplify-by-decoration --decorate --oneline \; \
	-execdir git clean -d --dry-run \;
