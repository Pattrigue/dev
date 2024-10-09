#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetCapsLockState, AlwaysOff

; Extra ISO key becomes shift
vke2::shift

; Swap backtick and escape since I use escape much more
Esc::SC029
SC029::Esc

; Ctrl + PrintScreen shortcut for opening the snipping tool
^PrintScreen::Send, #+{S}

; Nav layer, inspired by Dreymar's Extend layer from EPKL.
#If GetKeyState("CapsLock", "P")
u::Up
n::Left
e::Down
i::Right

j:: Send, {End}+{Home}
o::Backspace
`;::Del

l::Home
y::End

t::LCtrl
s::LShift
a::LAlt

r::WheelDown
w::WheelUp

f::!Left
p::!Right

z::^z
x::^x
c::^c
d::^d
v::^v

Backspace::^Backspace
Del::^Del

Up::^Up
Left::^Left
Down::^Down
Right::^Right

Space::Enter

#If
*CapsLock::
KeyWait, CapsLock
SendEvent {Shift Up}{Ctrl Up}{Alt Up}
Return

; --------------------------------------------------------------
; MacOS-like Functionality
; --------------------------------------------------------------

; Swap Left Alt and Left Ctrl
LAlt::LCtrl
LCtrl::LAlt

; Remap Ctrl-Tab to Alt-Tab
^Tab::
Send {Alt down}{Tab}
Keywait LAlt
Send {Alt up}
return

; Remap Ctrl-Shift-Tab to Alt-Shift-Tab
^+Tab::
Send {Alt down}{Shift down}{Tab}
Keywait LAlt
;