; Remap Ctrl-Tab to Alt-Tab
^Tab::
Send {Alt down}{Tab}
Keywait Ctrl
Send {Alt up}
return

; Remap Ctrl-Shift-Tab to Alt-Shift-Tab
^+Tab::
Send {Alt down}{Shift down}{Tab}
Keywait Ctrl
;