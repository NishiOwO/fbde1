# $Id$

DESTDIR=

BUILD = ./base ./libs ./docs

.PHONY: all distclean install clean $(BUILD)

all: $(BUILD)

./base/Makefile:
	cd base && ./configure $(ARGS)

./libs/Makefile:
	cd libs && ./configure $(ARGS)

./base:: ./base/Makefile ./libs
	$(MAKE) -C $@

./libs:: ./libs/Makefile
	$(MAKE) -C $@

./docs::
	$(MAKE) -C $@

clean:
	for i in $(BUILD); do \
		$(MAKE) -C $$i clean ; \
	done

install: all
	for i in $(BUILD); do \
		$(MAKE) -C $$i install DESTDIR=$(DESTDIR) ; \
	done

distclean:
	for i in $(BUILD); do \
		$(MAKE) -C $$i distclean DESTDIR=$(DESTDIR) ; \
	done
