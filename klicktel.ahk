#Persistent
global stopFunc := true  ; Globale Variable

; Deine wiederholende Funktion
code()
{
    global stopFunc      ; Zugriff auf die globale Variable
    stopFunc := false
	vv := 0
    Loop
    {
		Send, {Down}
        Loop, 74
		{
			; break here
			if (stopFunc) {
				break
			}
			Send, +{Down}
			Sleep, 50
		}
		
		
		Send, ^c
		ClipWait
		
		; break here
		if (stopFunc) {
            break
        }
		; save to file
		vv := vv + 1
		FilePath := vv . ".txt"
		FileAppend, %clipboard%, %FilePath%
		
		; break here
        if (stopFunc) {
            break
        }
    }
}
return

; Drücke "a", um die Funktion zu starten
f5::
if (stopFunc) {
    code()
}
return

; Drücke "j", um die Funktion zu stoppen
f6::
global stopFunc
if (!stopFunc) {
    stopFunc := true
}
return
