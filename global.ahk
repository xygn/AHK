F1::switchDesktopByNumber(1)
F2::switchDesktopByNumber(2)
F3::switchDesktopByNumber(3)
F4::switchDesktopByNumber(4)
F5::switchDesktopByNumber(5)
+F1::switchDesktopByNumber(6)
+F2::switchDesktopByNumber(7)
+F3::switchDesktopByNumber(8)
+F4::switchDesktopByNumber(9)

-::deleteVirtualDesktop()
=::createVirtualDesktop()

`::return

backspace::
	Send {AltDown}{Tab Down}{Tab Up}{AltUp}
return

;;------------------------NEXT ROW--------------------------;;
+r::Reload
+v::MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
tab::switchDesktopToLastOpened()

;   AMBOSS SEARCH
^a::
			MyClip := ClipboardAll
			Clipboard = ; empty the clipboard
			Send, ^c
			ClipWait, 2
			if ErrorLevel  ; ClipWait timed out.
			{
				return
			}
			if RegExMatch(Clipboard, "^[^ ]*\.[^ ]*$")
			{
				Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" %Clipboard%
			}
			else  
			{
				; Modify some characters that screw up the URL
				; RFC 3986 section 2.2 Reserved Characters (January 2005):  !*'();:@&=+$,/?#[]
				StringReplace, Clipboard, Clipboard, `r`n, %A_Space%, All
				StringReplace, Clipboard, Clipboard, #, `%23, All
				StringReplace, Clipboard, Clipboard, &, `%26, All
				StringReplace, Clipboard, Clipboard, +, `%2b, All
				StringReplace, Clipboard, Clipboard, ", `%22, All
				Run % "https://next.amboss.com/us/search?v=overview&q=" . clipboard ; uriEncode(clipboard)
			}
			Clipboard := MyClip
return
			;   -------------------!


^g::
				MyClip := ClipboardAll
				Clipboard = ; empty the clipboard
				Send, ^c
				ClipWait, 2
				if ErrorLevel  ; ClipWait timed out.
				{
					return
				}
				if RegExMatch(Clipboard, "^[^ ]*\.[^ ]*$")
				{
					Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" %Clipboard%
				}
				else  
				{
					; Modify some characters that screw up the URL
					; RFC 3986 section 2.2 Reserved Characters (January 2005):  !*'();:@&=+$,/?#[]
					StringReplace, Clipboard, Clipboard, `r`n, %A_Space%, All
					StringReplace, Clipboard, Clipboard, #, `%23, All
					StringReplace, Clipboard, Clipboard, &, `%26, All
					StringReplace, Clipboard, Clipboard, +, `%2b, All
					StringReplace, Clipboard, Clipboard, ", `%22, All
					Run % "https://www.google.com/search?hl=en&q=" . clipboard ; uriEncode(clipboard)
				}
				Clipboard := MyClip
return


^v:: 
if WinExist("ahk_exe Notion") 
{
	EL =
	trmp = %ClipboardAll% ; save clipboard
	Clipboard := "" ; clear clipboard
	Send, ^c ; simulate Ctrl+C (=selection in clipboard)
	ClipWait, 0, 1 ; wait until clipboard contains data
	selection = %Clipboard% ; save the content of the clipboard
	If (EL = 1)
	{
		sendinput {(}{)}{left}
	}
	else
	{
		Winactivate, ahk_exe Notion
		sendinput ^v
		Send, {Enter}
		Clipboard = %trmp% ; restore old content of the clipboard
	}
}
return



~space::RapidHotkey("!{Space}""#{Tab}}", "1""2")

;;===================== MODIFIERS =========================;;

*SC072::
	Run "C:\Program Files\Everything 1.5a\Everything64.exe"
return


insert::switchDesktopToLeft()
delete::switchDesktopToRight()



pgup::#PgUp
pgdn::#PgDn

DetectHiddenWindows On
^PgDn::Brightness(-1)
^PgUp::Brightness(+1)


;;================= NEXT SECTION ======================;;

up::^PgUp
down::^PgDn
; left::
; right::

; ;;================== THE NUMPAD ======================;;


ActSwitch(){
	If !WinExist(exe){
        Send #%winnum%
        WinWait, % exe
		sleep, 3000
		winactivate, % exe
    }
    else If WinExist(exe)
        If !WinActive(exe)
            WinActivate, % exe
        Else WinActivateBottom, % exe
}
Return

DetectHiddenWindows off

numpad0::
global exe := "ahk_exe TickTick"
global winnum := "0"
ActSwitch()
return

numpad1::
global exe := "ahk_exe Notion"
global winnum := "1"
ActSwitch()
return

numpad2::
global exe := "ahk_exe Edge"
global winnum := "2"
ActSwitch()
return

numpad3::
global exe := "ahk_exe Anki"
global winnum := "3"
ActSwitch()
return

numpad4::
global exe := "ahk_exe WhatsApp"
global winnum := "4"
ActSwitch()
return

numpad5::
	Run "C:\Program Files\Kodi\Kodi.exe"
return
; numpad6::
; numpad7::
; numpad8::
; ;numpad9::


; ;;NumLock::tooltip, DO NOT USE THIS IN YOUR 2ND KEYBOARD!
; numpadDiv::return
; numpadMult::return
; numpadSub::return
numpadAdd::Send {WinDown}{ShiftDown}
numpadEnter::Send {ShiftUp}{WinUp}
numpadDot::return
;;==================  ======================;;



#if
;#include %A_ScriptDir%/Lib/notion.ahk