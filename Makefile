version := $(shell $(MAKE) -C ../python --no-print-directory -s version | cut -d- -f1)
deps := python-gdbm libavahi-common-data python-dbus python-avahi python-ipaddr

include ../Makefile.default
include ../Makefile.tools


all: $(package).$(suffix)

clean: _clean

$(data): $(data_tree)
	dpkg -L $(deps) | grep "/usr/bin\|/usr/lib/python$(version)\|/usr/lib/pyshared/python$(version)\|/usr/lib/libpython\|/usr/share/python\|/usr/share/pyshared" | while read file; do \
		test -d "$$file" && mkdir -p "$@$$file"; \
		test -f "$$file" && cp -d "$$file" "$@$$file"; \
	done
