#SingleInstance force
#Persistent
#NoEnv
Menu, Tray, Icon, shell32.dll, 283 ;changes the taskbar icon to something

SendMode Input
SetWorkingDir %A_ScriptDir% ; Default in autohotkey v2.
AutoTrim, Off ; Default in autohotkey v2.
SetTitleMatchMode RegEx
#InstallKeybdHook
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#MenuMaskKey vk07 ;https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.


#include %A_ScriptDir%/Lib/DesktopSwitcher.ahk
#include %A_ScriptDir%/Lib/brightness.ahk
#include %A_ScriptDir%/Lib/RapidHotkey.ahk

GroupAdd, FileListers, ahk_class CabinetWClass
GroupAdd, FileListers, ahk_class WorkerW
GroupAdd, FileListers, ahk_class #32770, ShellView



#if (getKeyState("F23", "P")) && WinActive("ahk_group FileListers")
{
    #Include, %A_ScriptDir%\apps\explorer.ahk
    return
}

#if (getKeyState("F23", "P")) && WinActive("ahk_exe msedge.exe")
{
    #Include, %A_ScriptDir%\apps\edge.ahk
    return
}

#if (getKeyState("F23", "P")) && WinActive("ahk_exe Notion")
{
    #Include, %A_ScriptDir%\apps\notion.ahk
    return
}

#if (getKeyState("F23", "P")) ;<--Everything after this line will only happen on the secondary keyboard that uses F23.
{
    F23::return ;this line is mandatory for proper functionality
    #Include %A_ScriptDir%\global.ahk
    return
}

listener() {
    codeStr := ""
    Hotkey, <!Up, rkU, On
    Hotkey, <!Down, rkD, On
    Hotkey, <!Left, rkL, On
    Hotkey, <!Right, rkR, On
    Hotkey, <!PgUp, rkP, On
    Hotkey, <!PgDn, rkQ, On
    KeyWait LAlt
    Send % { U: "▲", D: "▼", L: "◄", R: "►", UU: "↑", DD: "↓", LL: "←", RR: "→", UD: "↕", DU: "↕", LR: "↔", RL: "↔", RU: "⤴", RD: "⤵", DL: "⤶", DR: "⤷", P: "↗", PP: "↗", Q: "↘", QQ: "↘", UUU: "⇑", UUUU: "⇑", DDD: "⇓", DDDD: "⇓", LLL: "⇐", LLLL: "⇐", RRR: "⇒", RRRR: "⇒", LRL: "⇔", RLR: "⇔", LRLR: "⇔", RLRL: "⇔", UDU: "⇕", DUD: "⇕", UDUD: "⇕", DUDU: "⇕" }[codeStr]
    Hotkey, <!Up, Off
    Hotkey, <!Down, Off
    Hotkey, <!Left, Off
    Hotkey, <!Right, Off
    Hotkey, <!PgUp, Off
    Hotkey, <!PgDn, Off
    return
    
    rkU:
    codeStr := codeStr . "U"
    return
    
    rkD:
    codeStr := codeStr . "D"
    return
    
    rkL:
    codeStr := codeStr . "L"
    return
    
    rkR:
    codeStr := codeStr . "R"
    return
    
    rkP:
    codeStr := codeStr . "P"
    return
    
    rkQ:
    codeStr := codeStr . "Q"
    return
}