#Requires AutoHotkey v2.0

MsgBox "Program started!"

threshold := 1080000 ; 18 minutes in ms
lastActive := A_TickCount

SetTimer(CheckIdle, 1000)

CheckIdle() {
    global lastActive, threshold
    if WinExist("ahk_exe RobloxPlayerBeta.exe") { ; Roblox running
        ; If Roblox is the active window and user interacted, reset timer
        if WinActive("ahk_exe RobloxPlayerBeta.exe") && (A_TimeIdlePhysical < 1000) {
            lastActive := A_TickCount
        }
        ; If idle too long, alert
        if (A_TickCount - lastActive > threshold) {
            SoundBeep(1000, 1500)
            MsgBox "You've been idle in Roblox for " threshold/60000 " minutes!"
            lastActive := A_TickCount  ; reset after alert
        }
    }
}