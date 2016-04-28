PROJECT = etcdc
TAG = $(shell cat src/$(PROJECT).app.src | \
	    sed -n -e 's/{vsn, \"\(.*\)\"},/\1/p' | \
		xargs)

DEPS = lhttpc \
	   lejson

dep_lejson = git https://github.com/campanja-forks/lejson.git 0.4.1
dep_lhttpc = git https://github.com/esl/lhttpc.git otp-17-compat

AUTOPATCH +=

include erlang.mk

.PHONY:

all::
	@erlc -o ebin -pa ebin test/*.erl
