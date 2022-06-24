
; Version: 2021.12.15.1
; Usage and examples: https://redd.it/owgn3j

Brightness(Offset)
{
	static wmi, last := -1, brightness := Brightness_Init(wmi)

	hWnd := DllCall("User32\FindWindow", "Str","NativeHWNDHost", "Ptr",0)
	PostMessage 0xC028, 0x037,,, % "ahk_id" hWnd
	brightness += Offset
	brightness := Min(100, Max(0, brightness))
	if (last = brightness)
		return
	last := brightness
	for method in wmi.ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods")
		method.WmiSetBrightness(0, brightness)
}

Brightness_Init(ByRef WmiObj)
{
	WmiObj := ComObjGet("winmgmts:\\.\root\WMI")
	for monitor in WmiObj.ExecQuery("SELECT * FROM WmiMonitorBrightness")
		return monitor.CurrentBrightness
}


