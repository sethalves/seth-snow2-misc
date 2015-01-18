TEST_DEPS="(seth-tests flex tests)"
include ../../makefiles/test.make

FLEX_TO_SCM=~/src/flex-table-to-scm/flex-table-to-scm-chibi.scm

all: snazzle.scm

snazzle.table: snazzle.l
	flex --tables-file=$@ $<

snazzle.scm: snazzle.table
	$(FLEX_TO_SCM) -i $^ snazzle -o $@

clean-extra:
	rm -f snazzle.table snazzle.scm lex.yy.c
