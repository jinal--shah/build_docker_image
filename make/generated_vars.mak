# vim: ts=4 st=4 sr noet smartindent syntax=make ft=make:
#
# generated_vars.mak
#
# vars in this file are determined at runtime using factors gleaned
# from the build environment and/or user-defined values (see user_vars.mak)
#
# So, only include this file, after any files defining user vars.

# ... AUDIT_MSG: used in annotation in git tag
# If built with Jenkins, BUILD_URL is defined.
ifeq ($(BUILD_URL),)
	AUDIT_MSG=$(shell git config user.name)@$(HOSTNAME)
else
	AUDIT_MSG=$(BUILD_URL)
endif
export AUDIT_MSG

export BUILD_TIME:=$(shell date +%Y%m%d%H%M%S)

export BUILD_GIT_TAG:=$(BUILD_TIME)
export BUILD_GIT_BRANCH:=$(shell git rev-parse --abbrev-ref HEAD) 

export BUILD_GIT_SHA:=$(shell git rev-parse --short=$(GIT_SHA_LEN) --verify HEAD)
export BUILD_GIT_REPO:=$(shell \
	git remote show -n origin  \
	| grep '^ *Push *'         \
	| awk {'print $$NF'}       \
)

export BUILD_GIT_ORG:=$(shell            \
	echo $(BUILD_GIT_REPO)               \
	| sed -e 's!.*[:/]\([^/]\+\)/.*!\1!' \
)
