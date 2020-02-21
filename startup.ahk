;#Include Host.ahk
;#Include AltWindowDrag.ahk
SetNumlockState, AlwaysOn
; Always run as admin


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
#m:: send vishnusai.karumuri@gmail.com 
#p:: Send Kvsnath$1155
^2::Send {Media_Play_Pause}
^1::Send {Media_Prev}
^3::Send {Media_Next}
#Enter:: Send {Volume_Mute}
PgUp:: Home
PgDn:: End
Ralt:: Send {AppsKey}
Return
^!t:: 
{
	Run C:\Users\KVSN\AppData\Local\Temp
	Run C:\Windows\Temp
	Return
}
^#i:: Run C:\Users\KVSN\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Internet Download Manager\Internet Download Manager.lnk
^!a:: Run C:\Users\KVSN\Documents\
^!c:: Run C:\Users\KVSN\Documents\Terminal.lnk
^!s:: Run D:\Softwares\EXE
^+q:: Run C:\Users\KVSN\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
^!m:: Run D:\Movies
^+v:: Run C:\Users\KVSN\Videos
^!d:: Run C:\Users\KVSN\Downloads\Compressed
+Tab:: Send #-
!q::
	ClipSaved := ClipboardAll      ; Save the entire clipboard to the variable ClipSaved
	clipboard := ""                ; empty clipboard
	Send, ^c                       ; copy the selected file
	ClipWait, 1                    ; wait for the clipboard to contain data
	if (!ErrorLevel)               ; If NOT ErrorLevel clipwait found data on the clipboard
	clipboard := clipboard         ; convert to text (= copy the path)
	Sleep, 300 
 	Return
Return
