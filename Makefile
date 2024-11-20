# $Id$

.PHONY: all distclean clean ./base ./libs

all: ./libs ./base

./base/Makefile: ./libs
	cd base && ./configure $(ARGS)

./libs/Makefile:
	cd libs && ./configure $(ARGS)

./base:: ./base/Makefile ./libs
	$(MAKE) -C $@

./libs:: ./libs/Makefile
	$(MAKE) -C $@

clean:
	-$(MAKE) -C ./base clean
	-$(MAKE) -C ./libs clean

distclean:
	-$(MAKE) -C ./base distclean
	-$(MAKE) -C ./libs distclean
