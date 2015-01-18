#
#
#

all:
	find . -name Makefile | grep -v '^./Makefile$$' | while read I; do (cd `dirname $$I` && make all); done

package:
	snow2 -r . package
	ls *.tgz | while read I; do   gunzip "$$I";   gzip -n -9 $${I%%.*}.tar;   mv $${I%%.*}.tar.gz $${I%%.*}.tgz; done

upload: package
	snow2 upload

check:
	snow2 -r . check -v

clean:
	rm -f *~ */*~ */*/*~ */*/*/*~
	rm -f *.tgz
	find . -name Makefile | grep -v '^./Makefile$$' | while read I; do (cd `dirname $$I` && make clean); done
