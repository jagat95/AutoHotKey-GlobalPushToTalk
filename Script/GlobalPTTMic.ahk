


#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#InstallKeybdHook
#UseHook
#persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.



Menu, Tray, NoStandard
Menu, Tray, Add, M&ute Mic,ExitSub
Menu, Tray, ToggleEnable, M&ute Mic
Menu, Tray, Add
Menu, Tray, Add, E&xit, ExitSub
Menu, Tray, Add, Restart, RestartSub
Menu, Tray, Icon, imageres.dll, 233, 1
Menu, Tray, Tip, Mic Muted
SetCapslockState AlwaysOFF
count = 0
Mic = -1
RestartSub:
	Loop
	{
		count += 1
		SoundGet, MicVol,MASTER,VOLUME, %A_Index%
		If (Mic == -1 && MicVol is float && Format("{:d}", MicVol) == 97)
		{
			Mic = %A_Index%
			tmp := Format("{:d}", MicVol)
			Menu, Tray, Icon, imageres.dll, 237, 1
			Menu, Tray, Tip, Mic Found: %A_Index% %tmp%
			break
		}
		else 
		{
			If (%A_Index% == Mic)
			{
				SoundSet, 1, MASTER, MUTE, %A_Index%
			}
			else
			{
				SoundSet, 0, MASTER, MUTE, %A_Index%
			}
		}
	}
return

SetTimer, RestartSub, Off

OnExit, ExitSub
	SoundSet, 1, , MUTE, %Mic%
Return

*Capslock::
	if (Mic < 0)
	{
		Menu, Tray, Icon, imageres.dll, 236, 1
		Menu, Tray, Tip, Mic Muted: Not Found %count%
		return
	}
	
	toggle := !toggle
	;Send,{Capslock DOWN}
	
	SetTimer, ReMute, Off
	
	Menu, Tray, Icon, imageres.dll, 233, 1
	Menu, Tray, Tip, Mic Muted:%Mic%
	
	SoundSet, 0, MASTER, MUTE, %Mic%
	
	;KeyWait Capslock
	
	;Send,{Capslock UP}
	
	;If toggle
	;	SetCapslockState AlwaysON
	;else
	;	SetCapslockState AlwaysOFF

   
return

*Capslock up::
	SetTimer, ReMute, 0
	return

ReMute:
	SoundSet, 1, MASTER, MUTE, %Mic%
	Menu, Tray, Icon, imageres.dll, 228, 1
	Menu, Tray, Tip, Mic Active:%Mic%
return

ExitSub:
    SoundSet, 0, , MUTE, %Mic%
    ExitApp