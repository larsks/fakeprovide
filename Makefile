prefix=/usr
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin

all:

install: all
	install -m 755 -d $(DESTDIR)$(bindir)
	install -m 755 fakeprovide $(DESTDIR)$(bindir)/fakeprovide

