#/bin/sh


find . -name .git \
	-execdir pwd \; \
       	-execdir git fetch --all \; \
	-execdir sh -c "git remote -v | grep -v patmcdonough | grep origin" \; \
	-execdir git log --branches --not --remotes --simplify-by-decoration --decorate --oneline \; \
	-execdir git clean -d --dry-run \;
