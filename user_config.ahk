; ====================
; === INSTRUCTIONS ===
; ====================
; 1. Any lines starting with ; are ignored
; 2. After changing this config file run script file "desktop_switcher.ahk"
; 3. Every line is in the format HOTKEY::ACTION

; === SYMBOLS ===
; !   <- Alt
; +   <- Shift
; ^   <- Ctrl
; #   <- Win
; For more, visit https://autohotkey.com/docs/Hotkeys.htm

; ===========================
; === END OF INSTRUCTIONS ===
; ===========================

SetWorkingDir, C:\ ;prevent secondary WT windows from opening in script dir

#1::switchDesktopByNumber(1)
#2::switchDesktopByNumber(2)
#3::switchDesktopByNumber(3)
#4::switchDesktopByNumber(4)
#5::switchDesktopByNumber(5)
#6::switchDesktopByNumber(6)
#7::switchDesktopByNumber(7)
#8::switchDesktopByNumber(8)
#9::switchDesktopByNumber(9)

#+1::MoveCurrentWindowToDesktop(1), switchDesktopByNumber(1)
#+2::MoveCurrentWindowToDesktop(2), switchDesktopByNumber(2)
#+3::MoveCurrentWindowToDesktop(3), switchDesktopByNumber(3)
#+4::MoveCurrentWindowToDesktop(4), switchDesktopByNumber(4)
#+5::MoveCurrentWindowToDesktop(5), switchDesktopByNumber(5)
#+6::MoveCurrentWindowToDesktop(6), switchDesktopByNumber(6)
#+7::MoveCurrentWindowToDesktop(7), switchDesktopByNumber(7)
#+8::MoveCurrentWindowToDesktop(8), switchDesktopByNumber(8)
#+9::MoveCurrentWindowToDesktop(9), switchDesktopByNumber(9)

#q::closeWindow()

#0::
WinGet, process, ProcessName, A
; 1. 资源管理
; 2. IM/Mail
; 3. office
; 4. si4
; 5. edge
; 6. text editor
; 7. vscode
if (process = "Explorer.EXE")
{
    vdesktop = 1
}
else if (process = "zMail.exe" or process = "iCenter.exe")
{
    vdesktop = 2
}
else if (process = "wps.exe" or process = "et.exe")
{
    vdesktop = 3
}
else if (process = "sourceinsight4.exe")
{
    vdesktop = 4
}
else if (process = "msedge.exe")
{
    vdesktop = 5
}
else if (process = "notepad.exe" or process = "notepad2.exe" or process = "BowPad.exe")
{
    vdesktop = 6
}
else if (process = "Code.exe")
{
    vdesktop = 7
}
else
{
    ToolTip, %process% not moved.
    SetTimer, RemoveToolTip, -5000
    return
}
MoveCurrentWindowToDesktop(vdesktop), switchDesktopByNumber(vdesktop)
ToolTip, %process% has moved to vdesktop:%vdesktop%.
SetTimer, RemoveToolTip, -5000
return

RemoveToolTip:
ToolTip
return


;#f::toggleMaximize()

; WSL -- create shortcut by dragging from start menu (can't be from a search result)
;#Enter::Run, C:\window-mover.git\Debian GNU-Linux

; Windows Terminal
; see here for wt.exe args: https://docs.microsoft.com/en-us/windows/terminal/command-line-arguments?tabs=windows

;WSL 1
#Enter::
Run, wt ;start terminal
Sleep, 750 ;wait for newest window to open
WinActivate, WSL1 ;just use a string that matches the start of the terminal window
return

;Powershell
#+Enter::
Run, wt -p "PowerShell 5"
Sleep, 750
WinActivate, PowerShell
return

;WSL2
#^Enter::
Run, wt -p "WSL2 (Ubuntu)"
Sleep, 750
WinActivate, WSL2
return