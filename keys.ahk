﻿#Requires AutoHotkey v2.0

; Remap Capslock to Ctrl
Capslock::Ctrl
Capslock Up:: Send("{Ctrl Up}"), A_PriorKey != "Capslock" ? "" : Send("{Esc}")
; Capslock Up:: Send("{Ctrl Up}"), A_PriorKey = "Capslock" ? Send("{Esc}") : ""

; Make space a modifier key
Space::return
Space Up:: A_PriorKey = "Space" ? Send("{Space}") : ""

#HotIf GetKeyState("Space", "P")
h::Left
j::Down
k::Up
l::Right
a:: Send "ä"
o:: Send "ö"
u:: Send "ü"
s:: Send "ß"
+a:: Send "Ä"
+o:: Send "Ö"
+u:: Send "Ü"
2:: Send "€"
e:: WinExist("ahk_exe code.exe") ? WinActivate() : Run(A_AppData "\..\Local\Programs\Microsoft VS Code\code.exe")
t:: WinExist("ahk_exe WindowsTerminal.exe") ? WinActivate() : Run("wt.exe")
b:: WinExist("ahk_exe msedge.exe") ? WinActivate() : Run("msedge.exe")
f:: WinExist("ahk_class CabinetWClass") ? WinActivate() : Run("C:\Users\" A_UserName "\Downloads")
m:: WinExist("ahk_exe olk.exe") ? WinActivate() : Run("olk.exe")
c:: WinExist("ahk_exe ms-teams.exe") ? WinActivate() : Run("ms-teams.exe")
/::^+a
#HotIf