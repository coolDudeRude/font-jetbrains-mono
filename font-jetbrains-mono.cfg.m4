// must be loaded AFTER config.cfg
divert(-1)
# setfont(<section>, <font>)
# This tests if cvar "font::<section>" is defined, if it's defined
# the value contained in the cvar is used. Otherwise, "font::<section>"
# is set to <font>
define(setfont, `alias _a::font::$1::config "set _c::font::$1::tresult 0; _a::font::$1::cfg"
alias _a::font::$1::tdef "set _c::font::$1::trash \"${font::$1 !}\"; _c::font::$1::tresult 1"
alias _a::font::$1::cfg "_a::font::$1::tdef; _a::font::$1::do_cfg"
alias _a::font::$1::do_cfg "_a::font::$1::cfg::0${_c::font::$1::tresult ?}"
alias _a::font::$1::cfg::0 "set font::$1 \"$2\"; echo Testing ^3font::$1^7 failed, falling back to default: ^2$2^7;"
alias _a::font::$1::cfg::00 "set font::$1 \"$2\"; echo ^2font::$1^7 cvar is not defined, setting ^3font::$1^7 to ^2$2^7;"
alias _a::font::$1::cfg::01 "set _c::font::test::emtpy \"${font::$1 ?}\"; _a::font::$1::nn"
alias _a::font::$1::nn "toggle _c::font::test::emtpy 1 \"\" 0; _a::font::$1::nn::do"
alias _a::font::$1::nn::do "_a::font::$1::nn::${_c::font::test::emtpy !}"
alias _a::font::$1::nn::1 "echo Using ^2font::$1 -> ${font::$1 !}^7 for ^3$1^7;"
alias _a::font::$1::nn::0 "font::$1 \"DEFAULT_FONT\"; echo ^1WARNING^7: ^3font::$1^7 contains null string, falling back to default ^2DEFAULT_FONT^7"
_a::font::$1::config
')

divert

setfont(console, FONT_CONSOLE)
setfont(notify, FONT_NOTIFY)
setfont(chat, FONT_CHAT)
setfont(centerprint, FONT_CENTERPRINT)
setfont(infobar, FONT_INFOBAR)
setfont(user0, FONT_USER0)
setfont(user1, FONT_USER1)
setfont(user2, FONT_USER2)
setfont(user3, FONT_USER3)

set menu_font_cfg font-jetbrains-mono.cfg
loadfont console fonts/${font::console !},fonts/unifont,fonts/xolonium-regular.otf,gfx/vera-sans $con_textsize
loadfont notify fonts/${font::notify !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans $con_notifysize
loadfont chat fonts/${font::chat !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans $con_chatsize
loadfont centerprint fonts/${font::centerprint !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 9
loadfont infobar fonts/${font::infobar !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 8 12 $scr_loadingscreen_barheight $scr_infobar_height
loadfont user0 fonts/${font::user0 !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 12 // menu font
loadfont user1 fonts/${font::user1 !},fonts/xolonium-regular.otf,fonts/unifont,gfx/vera-sans 4 6 8 10 12 14 16 20 24 28 32 $hud_fontsize // csqc font
loadfont user2 fonts/${font::user2 !},fonts/xolonium-bold.otf,fonts/unifont,gfx/vera-sans 4 6 8 10 12 14 16 20 24 28 32 $hud_fontsize // csqc bold font
loadfont user3 fonts/${font::user3 !},fonts/xolonium-bold.otf,fonts/unifont,gfx/vera-sans 12 16 // menu boldfont
scoreboard_columns_set
