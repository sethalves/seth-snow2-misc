
FLEX_TO_SCM=~/src/flex-table-to-scm/flex-table-to-scm-chibi.scm

all: scheme-reader-table.scm

scm-reader.table: scm-reader.l
	flex --tables-file=$@ $<

scheme-reader-table.scm: scm-reader.table
	$(FLEX_TO_SCM) -i $^ scheme-reader-table -o $@

clean:
	rm -f scm-reader.table scheme-reader-table.scm
