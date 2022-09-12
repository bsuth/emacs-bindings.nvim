local
CORE_WORD_CHARS
=
{
_
=
true
,
}
for
byte
=
string
.byte(
'0'
)
,
string
.byte(
'9'
)
do
CORE_WORD_CHARS
[
string
.char(
byte
)
]
=
true
end
for
byte
=
string
.byte(
'a'
)
,
string
.byte(
'z'
)
do
CORE_WORD_CHARS
[
string
.char(
byte
)
]
=
true
end
for
byte
=
string
.byte(
'A'
)
,
string
.byte(
'Z'
)
do
CORE_WORD_CHARS
[
string
.char(
byte
)
]
=
true
end
local
function
getWordChars
()
local
wordChars
=
{
}
for
coreWordChar
in
pairs(
CORE_WORD_CHARS
)
do
wordChars
[
coreWordChar
]
=
true
end
for
i
=
1
,
#
vim
.g
.emacs_bindings_wordchars
do
wordChars
[
vim
.g
.emacs_bindings_wordchars
:sub(
i
,
i
)
]
=
true
end
return
wordChars
end
local
function
wordBack
()
local
wordChars
=
getWordChars(
)
local
__ERDE_TMP_7__
=
vim
.fn
.getpos(
'.'
)
local _ = __ERDE_TMP_7__[1]
local lnum = __ERDE_TMP_7__[2]
local col = __ERDE_TMP_7__[3]
local
line
=
vim
.fn
.getline(
'.'
)
local
newCol
=
col
local
nextChar
=
line
:sub(
newCol
-
1
,
newCol
-
1
)
while
newCol
>
0
and
not
wordChars
[
nextChar
]
do
newCol
=
newCol
-
1
nextChar
=
line
:sub(
newCol
-
1
,
newCol
-
1
)
end
while
newCol
>
0
and
wordChars
[
nextChar
]
do
newCol
=
newCol
-
1
nextChar
=
line
:sub(
newCol
-
1
,
newCol
-
1
)
end
vim
.fn
.setpos(
'.'
,
{
0
,
lnum
,
newCol
,
0
,
}
)
end
local
function
wordForward
()
local
wordChars
=
getWordChars(
)
local
__ERDE_TMP_10__
=
vim
.fn
.getpos(
'.'
)
local _ = __ERDE_TMP_10__[1]
local lnum = __ERDE_TMP_10__[2]
local col = __ERDE_TMP_10__[3]
local
line
=
vim
.fn
.getline(
'.'
)
local
newCol
=
col
local
nextChar
=
line
:sub(
newCol
+
1
,
newCol
+
1
)
while
newCol
<
#
line
and
wordChars
[
nextChar
]
do
newCol
=
newCol
+
1
nextChar
=
line
:sub(
newCol
+
1
,
newCol
+
1
)
end
while
newCol
<
#
line
and
not
wordChars
[
nextChar
]
do
newCol
=
newCol
+
1
nextChar
=
line
:sub(
newCol
+
1
,
newCol
+
1
)
end
vim
.fn
.setpos(
'.'
,
{
0
,
lnum
,
newCol
+
1
,
0
,
}
)
end
return { wordBack=wordBack,wordForward=wordForward }
-- __ERDE_COMPILED__