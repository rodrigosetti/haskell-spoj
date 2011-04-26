#! /bin/make
# vim:set noexpandtab:

.PHONY: clean distclean all
programs = $(patsubst %.hs,%,$(wildcard *.hs))
all: $(programs)

$(programs): %: %.hs
	ghc --make $< -o $@

clean:
	$(RM) *.o *.hi

distclean: clean
	$(RM) $(programs)

