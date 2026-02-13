# JetBrains-Mono Font for Xonotic

> [!NOTE]
> JetBrainsMono fonts are provided under [OFL](./OFL.txt), while the reset
> of the configs and scripts in this repo are licensed under [MIT](./LICENSE).

## Build Dependencies

```bash
m4 moreutils make zip
```

## Building

To compile a single pk3 with all JetBrainsMono fonts simply run `make`, in the project directory.

## Usage

Place the compiled `font-jetbrains-mono.pk3` file in `~/.xonotic/data/` (aka, userdir)

## Changing Fonts

To change fonts, simply set a cvar `font::<section>` in your `autoexec.cfg`, with desired font name. For example to change `console` font to `JetBrainsMono-Italic`:

```
set font::console "JetBrainsMono-Italic"
exec font-jetbrains-mono.cfg
```

> [!CAUTION]
> When changing fonts this way make sure the font is loaded or avaliable in `~/.xonotic/data/fonts/` or is bundled with a font pk3.
