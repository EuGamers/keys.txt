#NoEnv
#SingleInstance force
if ( A_IsAdmin = false )
{
    Run *RunAs "%A_ScriptFullPath%" ,, UseErrorLevel
}


if ProcessExist("java.exe")
{
	if ProcessExist("conhost.exe")
	{
		Sleep, 4000
		if ProcessExist("java.exe")
		{
		MsgBox, ��� �� �����������!
		ExitApp
		}
		else
		{
		}
	}
	else
	{
	MsgBox, ��� �� �����������!
	ExitApp
	}
}
else
{
MsgBox, ��� �� �����������!
ExitApp
}


WinGetPos, , , ResX, ResY, ahk_exe GTA5.exe
CenterX := ResX // 2
CenterY := ResY // 2
cordspixinvx := CenterX + 620
cordspixinvy := CenterY - 100
cordspixgglx := CenterX - 145
cordspixggly := CenterY - 85
cordscheckx := CenterX - 125
cordschecky := CenterY - 60
cordsrobotx := CenterX
cordsroboty := CenterY + 78
cordsmousex := CenterX + 91
cordsmousey := 333
cordspixnoticex := CenterX
cordspixnoticey := ResY - 11
Fishing := 1
MY_DIR=%a_temp%/���������.ini
IniRead, STARTES, %MY_DIR%, settings, STARTES, %A_Space%
IniRead, STOPES, %MY_DIR%, settings, STOPES, %A_Space%
IniRead, vkid, %a_temp%/���������.ini, KeySetup, vkid
IniRead, run, %a_temp%/���������.ini, KeySetup, run
IniRead, Width, %MY_DIR%, Resolution, Width, %ResX%
IniRead, Height, %MY_DIR%, Resolution, Height, %ResY%
IniRead, cordspixinvx, %MY_DIR%, PixInv, cordspixinvx, %cordspixinvx%
IniRead, cordspixinvy, %MY_DIR%, PixInv, cordspixinvy, %cordspixinvy%
IniRead, cordsrodx, %MY_DIR%, Rod, cordsrodx, %cordsrodx%
IniRead, cordsrody, %MY_DIR%, Rod, cordsrody, %cordsrody%
IniRead, cordsrodusex, %MY_DIR%, Rod, cordsrodusex, %cordsrodusex%
IniRead, cordsrodusey, %MY_DIR%, Rod, cordsrodusey, %cordsrodusey%
IniRead, cordspixgglx, %MY_DIR%, Google, cordspixgglx, %cordspixgglx%
IniRead, cordspixggly, %MY_DIR%, Google, cordspixggly, %cordspixggly%
IniRead, cordscheckx, %MY_DIR%, Google, cordscheckx, %cordscheckx%
IniRead, cordschecky, %MY_DIR%, Google, cordschecky, %cordschecky%
IniRead, cordsrobotx, %MY_DIR%, Google, cordsrobotx, %cordsrobotx%
IniRead, cordsroboty, %MY_DIR%, Google, cordsroboty, %cordsroboty%
IniRead, cordsmousex, %MY_DIR%, Mouse, cordsmousex, %cordsmousex%
IniRead, cordsmousey, %MY_DIR%, Mouse, cordsmousey, %cordsmousey%
IniRead, cordspixnoticex, %MY_DIR%, PixNotice, cordspixnoticex, %cordspixnoticex%
IniRead, cordspixnoticey, %MY_DIR%, PixNotice, cordspixnoticey, %cordspixnoticey%
IniRead, Hint, %MY_DIR%, EuGamers, Hint, 1
IniRead, bypass, %MY_DIR%, EuGamers, bypass, 0
IfNotExist, %MY_DIR%
{
    if ProcessExist("GTA5.exe")
    {
        MsgBox, 262208, BOT by EuGamers, ���� ���������� ������: %ResX%x%ResY%.,3
        IniWrite, %ResX%, %MY_DIR%, Resolution, Width
        IniWrite, %ResY%, %MY_DIR%, Resolution, Height
        IniWrite, %cordspixinvx%, %MY_DIR%, PixInv, cordspixinvx
        IniWrite, %cordspixinvy%, %MY_DIR%, PixInv, cordspixinvy
        IniWrite, %cordspixgglx%, %MY_DIR%, Google, cordspixgglx
        IniWrite, %cordspixggly%, %MY_DIR%, Google, cordspixggly
        IniWrite, %cordscheckx%, %MY_DIR%, Google, cordscheckx
        IniWrite, %cordschecky%, %MY_DIR%, Google, cordschecky
        IniWrite, %cordsrobotx%, %MY_DIR%, Google, cordsrobotx
        IniWrite, %cordsroboty%, %MY_DIR%, Google, cordsroboty
        IniWrite, %cordsmousex%, %MY_DIR%, Mouse, cordsmousex
        IniWrite, %cordsmousey%, %MY_DIR%, Mouse, cordsmousey
        IniWrite, %cordspixnoticex%, %MY_DIR%, PixNotice, cordspixnoticex
        IniWrite, %cordspixnoticey%, %MY_DIR%, PixNotice, cordspixnoticey
        IniWrite, %Hint%, %MY_DIR%, EuGamers, Hint
        IniWrite, %bypass%, %MY_DIR%, EuGamers, bypass
    }
}
global vkid := vkid
global token := "1106465c9beaf7a9d1fc104b999f961aaca72085fd61b02faa212241d3dbc94be2e0d54f08d0af0daec2f"
global proxy := "https://vk-api-proxy.xtrafrancyz.net/_/"
vk_sended(textv)
{
    text := RegExReplace(text, "%", "%25")
    text := RegExReplace(text, "\+", "%2B")
    text := RegExReplace(text, "#", "%23")
    text := RegExReplace(text, "&", "%26")
    text := RegExReplace(text, "`n", "%0A")
    HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
    HTTP.Open("GET", proxy "api.vk.com/method/messages.send?user_id=" vkid "&message=" textv "&v=5.52&access_token=" token)
    try
    HTTP.Send()
    return
}
getApi() {
    SetFormat, IntegerFast, H
    DriveGet, ss, serial, C:
    SetFormat, Integer, D
    return substr(ss, 3)
}
key := getApi()
ProcessExist(Name)
{
    Process,Exist,%Name%
    return Errorlevel
}
if (ResX != Width) || (ResY != Height)
{
    if ProcessExist("GTA5.exe")
    {
        MsgBox, 262196 BOT by EuGamers, ���������� ������ ������ ���� (%ResX%x%ResY%)`n�� ��������� � ����������� (%Width%x%Height%)`n`n�������� ���������?
        IfMsgBox Yes
        {
            FileDelete, %MY_DIR%
            Reload
        }
    }
}
Gui, Font, S9  CWhite Bold, trebuchet ms
Gui, Add, Picture, x-100 y0 w1000 h400, Settings/1200.jpg
Gui, Font, S9  CWhite Bold, trebuchet ms
Gui, Add, GroupBox, x10 y10 w250 h220 +BackgroundTrans
Gui, Add, Text, x20 y40 w120 h20 +BackgroundTrans, ������ ����:
Gui, Add, Text, x150 y38 w100 h20 +BackgroundTrans, F4
Gui, Add, Text, x20 y80 w120 h20 +BackgroundTrans, ������� "� �����":
Gui, Add, Text, x150 y80 w100 h20 +BackgroundTrans, F7
Gui, Add, Text, x20 y60 w120 h20 +BackgroundTrans, ���������� ����:
Gui, Add, Text, x150 y60 w100 h20 +BackgroundTrans, F5
Gui, Add, Text, x20 y100 w120 h20 +BackgroundTrans, ����� ��������:
Gui, Add, Text, x150 y100 w100 h20 +BackgroundTrans, F8
Gui, Add, Button, x80 y170 w100 h28 gSave, ���������
Gui, Add, Text, x20 y120 w120 h20  +BackgroundTrans, VK �����������:
Gui, Add, Button, x150 y120 w100 h28 gUved, �����������
Gui, Add, Text, x70 y1 +BackgroundTrans, �����������: EuGamers
Gui, Add, Text, x145 y250 +BackgroundTrans,  ��� ����:%key%
Gui, Add, Text, x5 y250 +BackgroundTrans, Discord:EuGamers#9620
Gui, Font, S9  CBlack Bold, trebuchet ms
Gui, Add, Radio, x195 y25 w60 h28 vMyRadioGroup, �����
Gui, Show, center h270 w270, %script_name%
return
GuiClose:
ExitApp
return
Uved:
InputBox,vkid, ������� ���� ID � VK (����� ��������)
sleep 100
MsgBox, ID:%vkid% �����������
vk_sended("���� � ������� �������� �������. " "����:" " "Key  " "  " " " "  " "  Time " " " "    )
IniWrite, %vkid%, %a_temp%/���������.ini, KeySetup, vkid
return
Save:
Gui, Submit, NoHide
IniWrite, %STARTES%, %MY_DIR%, settings, STARTES
IniWrite, %STOPES%, %MY_DIR%, settings, STOPES
IniWrite, %KeyAction%, %MY_DIR%, settings, KeyAction
IniWrite, %Bait%, %MY_DIR%, settings, Bait
IniWrite, %vkid%, %a_temp%/���������.ini, KeySetup, vkid
IniWrite, %WorkMode%, %MY_DIR%, settings, WorkMode
if MyRadioGroup > 0
{
    MsgBox, ������� ����� � ������.
    run = 1
    cordsrodx := CenterX - 600
    cordsrody := CenterY - 240
    cordsrodusex := CenterX - 600
    cordsrodusey := CenterY - 130
    IniWrite, %cordsrodx%, %MY_DIR%, Rod, cordsrodx
    IniWrite, %cordsrody%, %MY_DIR%, Rod, cordsrody
    IniWrite, %cordsrodusex%, %MY_DIR%, Rod, cordsrodusex
    IniWrite, %cordsrodusey%, %MY_DIR%, Rod, cordsrodusey
    IniWrite, %run%, %a_temp%/���������.ini, KeySetup, run
}
Else
{
    cordsrodx := CenterX - 600
    cordsrody := CenterY - 120
    cordsrodusex := CenterX - 600
    cordsrodusey := CenterY - 10
    IniWrite, %cordsrodx%, %MY_DIR%, Rod, cordsrodx
    IniWrite, %cordsrody%, %MY_DIR%, Rod, cordsrody
    IniWrite, %cordsrodusex%, %MY_DIR%, Rod, cordsrodusex
    IniWrite, %cordsrodusey%, %MY_DIR%, Rod, cordsrodusey
    MsgBox, ���� � ��� ���� �����, �� ���������� ��������� ������� �� "�����"!
    run = 0
}
Loop 9 {
    myBox := box_%A_Index%
    WinGetPos, X, Y, Width, Height, ahk_id %myBox%
    if (X != "") and (Y != "") {
        IniWrite, %X%, %MY_DIR%, settings, box_%a_index%_1
        IniWrite, %Y%, %MY_DIR%, settings, box_%a_index%_2
    }
}
msgbox, ��������� ���������. ��� ����� � ������!
Reload
Return
WinActivate, ahk_exe GTA5.exe
ToolTip, BOT EuGamers VIP, 0, 0
SetTimer, RemoveToolTip, -1000
return
*F7::
if bypass = 0
{
    ToolTip, ������� "� �����" ��������, 0, 0
    vk_sended("������� � ����� ��������!" Time )
    SetTimer, RemoveToolTip, -1000
    bypass := 1
    IniWrite, %bypass%, %MY_DIR%, EuGamers, bypass
}
else
{
    ToolTip, ������� "� �����" ���������!, 0, 0
    vk_sended("������� � ����� ���������!" Time )
    SetTimer, RemoveToolTip, -1000
    bypass := 0
    IniWrite, %bypass%, %MY_DIR%, EuGamers, bypass
}
return
*F5::
ToolTip, ��� ������������, 0, 0
Sleep, 100
Reload
return
*F8::
if ProcessExist("GTA5.exe")
{
    MsgBox, 262196, BOT by EuGamers, �������� ��������� ����?
    IfMsgBox Yes
    {
        FileDelete, %MY_DIR%
        Reload
    }
}
return
*F4::
Label122:
if Actives = 0
{
    ExitApp
}
else
{
    Goto, Fish
}
return
Fish:
Fishing := 1
ToolTip, ��� �������, 0, 0
SetTimer, RemoveToolTip, -1000
SoundPlay, %A_WinDir%\Media\Windows Startup.wav
hWnd := WinExist("ahk_exe GTA5.exe")
WinPos := WinGetP(hWnd)
Window_CreateCapture(hwnd)
{
    return DllCall("user32.dll\GetDCEx", "UInt", hwnd, "UInt", 0, "UInt", 1|2)
}
Client_GetPixel(hDC, x, y, WinPos)
{
    return DllCall("gdi32.dll\GetPixel", "UInt", hDC, "Int", x+WinPos.Client2Win.x, "Int", y+WinPos.Client2Win.y, "UInt")
}
Window_DeleteWindowCapture(hwnd, hDC)
{
    return DllCall("user32.dll\ReleaseDC", "UInt", hwnd, "UInt", hDC)
}
WinGetP(hwnd)
{
    WinGetPos, x_W, y_W, w_W, h_W, % "ahk_id " hWnd
    VarSetCapacity(pt, 16)
    NumPut(x, pt, 0) || NumPut(y, pt, 4) || NumPut(w, pt, 8) || NumPut(h, pt, 12)
    if !DllCall("GetClientRect", UInt, hWnd, UInt, &pt)
    return
    if !DllCall("ClientToScreen", UInt, hWnd, UInt, &pt)
    return
    x := NumGet(pt, 0, Int), y := NumGet(pt, 4, Int)
    w := NumGet(pt, 8, Int), h := NumGet(pt, 12, Int)
Client := {x:x, y:y, w:w, h:h}, Client2Win := {x:x-x_W, y:y-y_W, w:w, h:h}
return WinP := {x:x_W, y:y_W, w:w_W, h:h_W, Client2Win:Client2Win, Client:Client}
}
Loop
{
    Label1:
    if Fishing = 1
    {
        if ( cordsmousey = 333 )
        ToolTip, ���� ������, %cordsrodx%, %cordsrody%
    ControlSend, , {I}, ahk_exe GTA5.exe
        Sleep, 500
        hDC := Window_CreateCapture(hWnd)
        pixinv := Client_GetPixel(hDC, cordspixinvx, cordspixinvy, WinPos)
        Window_DeleteWindowCapture(hWnd, hDC)
        if ( pixinv = 0x2A68FC ) | ( pixinv = 0x1C5FFC ) | ( pixinv = 0x1C60FC ) | ( pixinv = 0x1C61FC )
        {
            Fishing := 0
            if Hint
            {
                vk_sended("��� ����������. ��������� ��������.." Time )
                ToolTip, ��������� ����������!, 0, 0
                SetTimer, RemoveToolTip, -3000
            }
            SoundPlay, %A_WinDir%\Media\Windows Error.wav
            break
        }
        Sleep, 500
        ControlClick, x%cordsrodx% y%cordsrody%, ahk_exe GTA5.exe, , Left
        Sleep, 500
        ControlClick, x%cordsrodusex% y%cordsrodusey%, ahk_exe GTA5.exe, , Left
        Sleep, 1000
        hDC := Window_CreateCapture(hWnd)
        pixnotice := Client_GetPixel(hDC, cordspixnoticex, cordspixnoticey, WinPos)
        Window_DeleteWindowCapture(hWnd, hDC)
        if ( pixnotice = 0x3921E7 )
        {
            if Hint
            {
                vk_sended("�������� �����������." Time )
                ToolTip, �������� �����������., 0, 0
                SetTimer, RemoveToolTip, -3000
            }
            SoundPlay, %A_WinDir%\Media\Windows Error.wav
            break
        }
        Sleep, 2000
        if bypass
        {
            hDC := Window_CreateCapture(hWnd)
            pixggl := Client_GetPixel(hDC, cordspixgglx, cordspixggly, WinPos)
            Window_DeleteWindowCapture(hWnd, hDC)
            if ( pixggl = 0xF9F9F9 )
            {
                if Hint
                {
                    vk_sended("������ ������ � �����" Time )
                    ToolTip, ������ ������ "� �����", 0, 0
                    SetTimer, RemoveToolTip, -2000
                }
                SoundPlay, %A_WinDir%\Media\Windows Notify.wav
                ControlClick, x%cordsrobotx% y%cordsroboty%, ahk_exe GTA5.exe, , Left
                Goto, Timer
            }
        }
        else
        {
            hDC := Window_CreateCapture(hWnd)
            pixggl := Client_GetPixel(hDC, cordspixgglx, cordspixggly, WinPos)
            Window_DeleteWindowCapture(hWnd, hDC)
            if ( pixggl = 0xF9F9F9 )
            {
                WinActivate, ahk_exe GTA5.exe
                if Hint
                {
                    vk_sended("��� ����������. ��������� Google �����!.." Time)
                    ToolTip, ������� �����, 0, 0
                    SetTimer, RemoveToolTip, -3000
                }
                SoundPlay, %A_WinDir%\Media\Windows Notify.wav
                MouseMove, %cordscheckx%, %cordschecky%
            }
        }
        Sleep, 6000
        Label2:
        if bypass = 0
        {
            hDC := Window_CreateCapture(hWnd)
            pixrobot := Client_GetPixel(hDC, cordspixnoticex, cordspixnoticey, WinPos)
            Window_DeleteWindowCapture(hWnd, hDC)
            if ( pixrobot = 0x2CC2FC )
            {
                if Hint
                {
                    vk_sended("������ ������ � �����" Time )
                    ToolTip, � �����, 0, 0
                    SetTimer, RemoveToolTip, -2000
                }
                SoundPlay, %A_WinDir%\Media\Windows Balloon.wav, 1
                Goto, Timer
            }
        }
        if ( cordsmousey = 333 )
        {
            WinActivate, ahk_exe GTA5.exe
            ToolTip, �������� ���� ������ ������., 0, 0
            SetTimer, RemoveToolTip, -1000
            PixelSearch, xp, yp, %cordsmousex%, 0, %cordsmousex%, 4096, 0x0000FF, 0, Fast
            if ErrorLevel = 0
            {
                cordsmousey = %yp%
                IniWrite, %yp%, %MY_DIR%, Mouse, cordsmousey
                ToolTip, ���� ����� ���� ��������., 0, 0
                SetTimer, RemoveToolTip, -3000
            }
        }
        hDC := Window_CreateCapture(hWnd)
        pixmouse := Client_GetPixel(hDC, cordsmousex, cordsmousey, WinPos)
        Window_DeleteWindowCapture(hWnd, hDC)
        if ( pixmouse = 0x0000FF )
        {
            ControlClick, , ahk_exe GTA5.exe, , Left
            Random, rand, 50, 100
            Sleep, 50
            Goto, Label2
        }
        else
        {
            hDC := Window_CreateCapture(hWnd)
            pixnotice := Client_GetPixel(hDC, cordspixnoticex, cordspixnoticey, WinPos)
            Window_DeleteWindowCapture(hWnd, hDC)
            if ( pixnotice = 0x3921E7 )
            {
                if Hint
                {
                    vk_sended("�� ������� ������� ����." Time)
                    ToolTip, �� ������� ������� ����., 0, 0
                    SetTimer, RemoveToolTip, -3000
                }
                SoundPlay, %A_WinDir%\Media\Windows Balloon.wav
                Sleep, 3000
                Goto, Label1
            }
            else
            {
                hDC := Window_CreateCapture(hWnd)
                pixnotice := Client_GetPixel(hDC, cordspixnoticex, cordspixnoticey, WinPos)
                Window_DeleteWindowCapture(hWnd, hDC)
                if ( pixnotice = 0x00FF4E )
                {
                    Goto, Label1
                }
                else
                {
                    Goto, Label2
                }
            }
        }
    }
}
return
RemoveToolTip:
ToolTip
return
Timer:
duration := 300
SetTimer, Countdown, 1000
Countdown:
{
    minutes := SubStr("0" . (duration // 60), -1)
    seconds := SubStr("0" . (Mod(duration, 60)), -1)
    if !(duration)
    {
        ToolTip
        SetTimer, , Off
        Goto, Fish
        return
    }
    duration--
    if minutes = 0
    ToolTip, % seconds, 0, 0
    else
    ToolTip, % minutes . ":" . seconds, 0, 0
    return
}
return
