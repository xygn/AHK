`::
        Send {CtrlDown}{\}{CtrlUp}
return

t::
	Send, /tableview {Enter}
return
	




<!/:: listener()

; New Tab
+tab::Send {CtrlDown}{t}{CtrlUp}{Tab up}

; Search bar
q::Send {CtrlDown}{p}{CtrlUp}
; Switch tabs
;Left::Send {CtrlDown}{PgUp}{CtrlUp}
;Right::Send {CtrlDown}{PgDn}{CtrlUp}

; colors /color
C::Send, /color
H::Send {CtrlDown}{ShiftDown}{H}{ShiftUp}{CtrlUp} ; last highlight

; headings
1::Send {CtrlDown}{ShiftDown}{1}{ShiftUp}{CtrlUp}
2::Send {CtrlDown}{ShiftDown}{2}{ShiftUp}{CtrlUp}
3::Send {CtrlDown}{ShiftDown}{3}{ShiftUp}{CtrlUp}

; new page
n::Send, {CtrlDown}{ShiftDown}{n}{ShiftUp}{CtrlUp}


; go ahead page, go behind
]::Send, {CtrlDown}]{CtrlUp}
[::Send, {CtrlDown}[{CtrlUp}
; Search
+Space::Send, {CtrlDown}P{CtrlUp}
; turn into 
/::Send, /turn {Enter}
; link [[]]
L::Send, [[
; /div creates a light gray divider.
-::Send, /div{Enter}
; file /file
F::Send, /file {Enter}
; toc /toc
^C::Send, /toc{Enter}
; select last word and go just like that → Shift + Ctrl + Arrow
.::Send, {CtrlDown}{ShiftDown}{Right}{ShiftUp}{CtrlUp}
,::Send, {CtrlDown}{ShiftDown}{Left}{ShiftUp}{CtrlUp}
; jump words  → Ctrl + Arrow 
Right::Send, {CtrlDown}{Right}{CtrlUp}
Left::Send, {CtrlDown}{Left}{CtrlUp}

;comment
+C::Send, {CtrlDown}{ShiftDown}{M}{ShiftUp}{CtrlUp}
;move to
M::Send, {CtrlDown}{ShiftDown}{P}{ShiftUp}{CtrlUp}