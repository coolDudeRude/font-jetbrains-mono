PP=m4
PPFLAGS=
# Only include single font, which is specified via DEFAULT_FONT
DEFAULT_FONT ?=JetBrainsMonoNL-Bold
# Use default font for each section, unless specified.
FONT_CONSOLE ?=$(DEFAULT_FONT)
FONT_CHAT ?=$(DEFAULT_FONT)
FONT_NOTIFY ?=$(DEFAULT_FONT)
FONT_CENTERPRINT ?=$(DEFAULT_FONT)
FONT_INFOBAR ?=$(DEFAULT_FONT)
FONT_USER0 ?=$(DEFAULT_FONT)
FONT_USER1 ?=$(DEFAULT_FONT)
FONT_USER2 ?=$(DEFAULT_FONT)
FONT_USER3 ?=$(DEFAULT_FONT)

PPFLAGS+=-DDEFAULT_FONT="$(DEFAULT_FONT)"
PPFLAGS+=-DFONT_CONSOLE="$(FONT_CONSOLE)"
PPFLAGS+=-DFONT_NOTIFY="$(FONT_NOTIFY)"
PPFLAGS+=-DFONT_CHAT="$(FONT_CHAT)"
PPFLAGS+=-DFONT_CENTERPRINT="$(FONT_CENTERPRINT)"
PPFLAGS+=-DFONT_INFOBAR="$(FONT_INFOBAR)"
PPFLAGS+=-DFONT_USER0="$(FONT_USER0)"
PPFLAGS+=-DFONT_USER1="$(FONT_USER1)"
PPFLAGS+=-DFONT_USER2="$(FONT_USER2)"
PPFLAGS+=-DFONT_USER3="$(FONT_USER3)"

font-jetbrains-mono.pk3: $(wildcard fonts/*.ttf) AUTHORS.txt OFL.txt font-jetbrains-mono.cfg
	zip font-jetbrains-mono.pk3 -r fonts/ OFL.txt AUTHORS.txt font-jetbrains-mono.cfg

font-jetbrains-mono.cfg: font-jetbrains-mono.cfg.m4
	$(PP) $(PPFLAGS) font-jetbrains-mono.cfg.m4 | sponge font-jetbrains-mono.cfg

.PHONY: clean
clean:
	rm -f font-jetbrains-mono.pk3
	rm -f font-jetbrains-mono.cfg
