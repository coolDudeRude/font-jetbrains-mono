PP=m4
PPFLAGS=
# Only include single font, which is specified via DEFAULT_FONT
SINGLE_FONT ?= no
DEFAULT_FONT ?=JetBrainsMonoNL-Bold

ifeq ($(SINGLE_FONT),yes)
PPFLAGS+=-DSINGLE_FONT
DESIRED_FONT=fonts/$(DEFAULT_FONT).ttf
ZIP_TTF="$(DESIRED_FONT)"
else
DESIRED_FONT=$(wildcard fonts/*.ttf)
ZIP_TTF=-r fonts
endif

PPFLAGS+=-DDEFAULT_FONT="$(DEFAULT_FONT)"

font-jetbrains-mono.pk3: $(DESIRED_FONT) AUTHORS.txt OFL.txt font-jetbrains-mono.cfg
	zip font-jetbrains-mono.pk3 $(ZIP_TTF) OFL.txt AUTHORS.txt font-jetbrains-mono.cfg

font-jetbrains-mono.cfg: font-jetbrains-mono.cfg.m4
	$(PP) $(PPFLAGS) font-jetbrains-mono.cfg.m4 | sponge font-jetbrains-mono.cfg

.PHONY: clean
clean:
	rm -f font-jetbrains-mono.pk3
	rm -f font-jetbrains-mono.cfg
