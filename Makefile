version := 0.6.31
deps := python python-gdbm libavahi-common-data python-dbus python-avahi

include ../Makefile.default
include ../Makefile.tools


all: $(package).$(suffix)

clean: _clean

$(data): $(data_tree)
	
