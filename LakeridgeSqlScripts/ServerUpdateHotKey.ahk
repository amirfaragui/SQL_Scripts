#Requires AutoHotkey v2.0
SetTitleMatchMode 2

; --- Run your EXE ---
Run("C:\newsys\bin\SRVUPT32.EXE")   

; --- Wait for window ---
WinWait("Server Update")
WinActivate("Server Update")

; --- Select LR_BASED in ListBox2 ---
ControlChooseString("LR_BASED", "ListBox2", "Server Update")

; --- Click Komplett-Update ---
ControlClick("Button2", "Server Update")   