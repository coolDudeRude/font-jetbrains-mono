// must be loaded AFTER config.cfg
ifdef(`SINGLE_FONT',
`set jbmono::font "DEFAULT_FONT"',
`set _cvar::font::jbmono::default "DEFAULT_FONT"
alias _alias::font::jbmono::config "set _cvar::font::jbmono::tresult 0; _alias::font::jbmono::cfg"
alias _alias::font::jbmono::tdef "set _cvar::font::jbmono::trash ${jbmono::font !}; _cvar::font::jbmono::tresult 1"
alias _alias::font::jbmono::cfg "_alias::font::jbmono::tdef; _alias::font::jbmono::do_cfg"
alias _alias::font::jbmono::do_cfg "_alias::font::jbmono::cfg::0${_cvar::font::jbmono::tresult ?}"
alias _alias::font::jbmono::cfg::0 "set jbmono::font ${_cvar::font::jbmono::default !}; echo Script encountered an error, falling back to default: ${_cvar::font::jbmono::default !};"
alias _alias::font::jbmono::cfg::00 "set jbmono::font ${_cvar::font::jbmono::default !}; echo ^2jbmono::font^7 cvar is not defined, defining with default value (^2jbmono::font -> ${_cvar::font::jbmono::default !}^7);"
alias _alias::font::jbmono::cfg::01 "echo loading ${jbmono::font !}.ttf"

_alias::font::jbmono::config
')
set menu_font_cfg font-jetbrains-mono.cfg
loadfont console fonts/${jbmono::font !},fonts/unifont,fonts/xolonium-regular.otf,gfx/vera-sans $con_textsize
loadfont notify fonts/${jbmono::font !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans $con_notifysize
loadfont chat fonts/${jbmono::font !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans $con_chatsize
loadfont centerprint fonts/${jbmono::font !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 9
loadfont infobar fonts/${jbmono::font !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 8 12 $scr_loadingscreen_barheight $scr_infobar_height
loadfont user0 fonts/${jbmono::font !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 12 // menu font
loadfont user1 fonts/${jbmono::font !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 4 6 8 10 12 14 16 20 24 28 32 $hud_fontsize // csqc font
loadfont user2 fonts/${jbmono::font !},fonts/xolonium-bold.otf,fonts/unifont,gfx/vera-sans 4 6 8 10 12 14 16 20 24 28 32 $hud_fontsize // csqc bold font
loadfont user3 fonts/${jbmono::font !},fonts/xolonium-bold.otf,fonts/unifont,gfx/vera-sans 12 16 // menu boldfont
scoreboard_columns_set
