#Requires AutoHotkey v2.0
#SingleInstance Force ; Ensure only one instance of the script runs

; Remap Capslock to Ctrl
CapsLock::Ctrl
CapsLock Up:: Send("{Ctrl Up}"), A_PriorKey = "CapsLock" ? Send("{Esc}") : ""

; Make space a modifier key
Space:: return
Space Up:: A_PriorKey = "Space" ? Send("{Space}") : ""

#HotIf GetKeyState("Space", "P")
*h::SendInput "{Blind}{Left}"
*j::SendInput "{Blind}{Down}"
*k::SendInput "{Blind}{Up}"
*l::SendInput "{Blind}{Right}"
a:: Send "ä"
o:: Send "ö"
u:: Send "ü"
s:: Send "ß"
+a:: Send "Ä"
+o:: Send "Ö"
+u:: Send "Ü"
2:: Send "€"
t:: WinExist("ahk_exe WindowsTerminal.exe") ? WinActivate() : Run("wt.exe")
b:: WinExist("ahk_exe msedge.exe") ? WinActivate() : Run("msedge.exe")
f:: WinExist("ahk_class CabinetWClass") ? WinActivate() : Run("C:\Users\" A_UserName "\Downloads")
; e:: WinExist("ahk_exe code.exe") ? WinActivate() : Run(A_AppData "\..\Local\Programs\Microsoft VS Code\code.exe")
; m:: WinExist("ahk_exe msedge.exe") ? Run("msedge.exe https://outlook.office.com/mail/ --new-tab") : Run("msedge.exe https://outlook.office.com/mail/")
; c:: WinExist("ahk_exe msedge.exe") ? Run("msedge.exe https://teams.microsoft.com/v2/ --new-tab") : Run("msedge.exe https://teams.microsoft.com/v2/")
; m:: WinExist("ahk_exe olk.exe") ? WinActivate() : Run("olk.exe")
; c:: WinExist("ahk_exe ms-teams.exe") ? WinActivate() : Run("ms-teams.exe")
/::^+a
#HotIf