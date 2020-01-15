SetNumlockState, AlwaysOn
; Always run as admin
if not A_IsAdmin
{
   Run, *RunAs %A_ScriptFullPath% ; Requires v1.0.92.01+
   ExitApp
}


; Empty trash
#Del::FileRecycleEmpty ; win + del
return

; Suspend AutoHotKey
Insert::
Suspend, Toggle	
If A_IsSuspended
{
	message=Startup Script Paused
}
else
{
	message=Start Up Script Running
}
MsgBox, 0,Startup Script, %message%
return


; WINDOWS KEY + H TOGGLES HIDDEN FILES
#h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
If HiddenFiles_Status = 2 
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
Else 
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
Send {F5}
Return


; WINDOWS KEY + f TOGGLES FILE EXTENSIONS
#f::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
If HiddenFiles_Status = 1
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
Else
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
Send {F5}
Return


;Web Search 
^+c::
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return


;hotkey binds
;I use brave browser coz I like it but u can rename 'brave.exe' to the name of your favourite browser like 'chrome.exe'
#c:: 
IfWinExist ahk_exe brave.exe
{
    WinActivate ahk_exe brave.exe
}
Else
{
	Run C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe
	WinActivate ahk_exe brave.exe
}
Return
#m:: send YOUR-MAIL-HERE
#p:: Send YOUR-PASSWORD-HERE-NOT-RECOMMENDED-USING-ON-PUBLIC-COMPUTERS
#Enter:: Send {Volume_Mute};To mute the volume
PgUp:: Home
PgDn:: End
Ralt:: AppsKey;simulates the menukey in old dell laptops , grown used to it , cant live without it
^!t:: 
{
	Run C:\Users\YOUR-USERNAME\AppData\Local\Temp;open both temp folders if you feel those are lagging your PC down
	Run C:\Windows\Temp
	Return
}
^#i:: Run C:\Users\YOUR-USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Internet Download Manager\Internet Download Manager.lnk
^!a:: Run C:\Users\YOUR-USERNAME\Documents\
^!c:: Run C:\Users\YOUR-USERNAME\Documents\Terminal.lnk
^+q:: Run C:\Users\YOUR-USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup;To quickly access startup programs folder
^+v:: Run C:\Users\YOUR-USERNAME\Videos
^!d:: Run C:\Users\YOUR-USERNAME\Downloads\
Return
