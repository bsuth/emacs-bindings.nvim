local
emacs
=
require(
'emacs-bindings'
)
if
vim
.g
.loaded_emacs_bindings
then
return
end
vim
.g
.loaded_emacs_bindings
=
true
vim
.g
.emacs_bindings_wordchars
=
vim
.g
.emacs_bindings_wordchars
or
os
.getenv(
'WORDCHARS'
)
or
'*?_-.[]~='
vim
.g
.emacs_bindings_modes
=
vim
.g
.emacs_bindings_modes
or
'ic'
local
VALID_MODES
=
{
i
=
true
,
c
=
true
,
n
=
true
,
v
=
true
,
}
for
i
=
1
,
#
vim
.g
.emacs_bindings_modes
do
local
modeChar
=
vim
.g
.emacs_bindings_modes
:sub(
i
,
i
)
if
VALID_MODES
[
modeChar
]
then
vim
.keymap
.set(
modeChar
,
'<c-b>'
,
'<Left>'
)
vim
.keymap
.set(
modeChar
,
'<c-f>'
,
'<Right>'
)
vim
.keymap
.set(
modeChar
,
'<c-a>'
,
'<Home>'
)
vim
.keymap
.set(
modeChar
,
'<c-e>'
,
'<End>'
)
vim
.keymap
.set(
modeChar
,
'<m-b>'
,
emacs
.moveWordBack
)
vim
.keymap
.set(
modeChar
,
'<m-f>'
,
emacs
.moveWordForward
)
vim
.keymap
.set(
modeChar
,
'<c-h>'
,
emacs
.deleteCharBack
)
vim
.keymap
.set(
modeChar
,
'<c-d>'
,
emacs
.deleteCharForward
)
vim
.keymap
.set(
modeChar
,
'<m-backspace>'
,
emacs
.deleteWordBack
)
vim
.keymap
.set(
modeChar
,
'<m-d>'
,
emacs
.deleteWordForward
)
vim
.keymap
.set(
modeChar
,
'<c-u>'
,
emacs
.deleteLineBack
)
vim
.keymap
.set(
modeChar
,
'<c-k>'
,
emacs
.deleteLineForward
)
end
end
-- __ERDE_COMPILED__