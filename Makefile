# $Id$

.PHONY: all distclean install clean ./base ./libs

all: ./libs ./base

./base/Makefile:
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

install: all
	$(MAKE) -C ./base install
	$(MAKE) -C ./libs install

distclean:
	-$(MAKE) -C ./base distclean
	-$(MAKE) -C ./libs distclean
