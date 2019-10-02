#include <GUIListView.au3>
#include <Array.au3>
#include <AutoItConstants.au3>
#include <./GetGUIListViewContents.au3>
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:       Michael Dennis

 Script Function:
	Sets Default Sound Items.
	
Date Created:
	10/1/2019

#ce ----------------------------------------------------------------------------

Func launchSound()
	Run("control.exe mmsys.cpl", "", @SW_HIDE)
	WinWait("Sound")
EndFunc

Func setDefaultSoundItem($device)

	launchSound()

	Local $soundList = ControlGetHandle("Sound","","SysListView321")
	Local $soundItems = _GUICtrlListView_GetContents($soundList)


	$soundItemIndex = getSoundItemByIndex($soundItems,$device)

	If $soundItemIndex = -1 Then
		MsgBox(0,"Invalid Sound Item","Sound Item: '" & $device & "' Does not exist")
	Else
		_GUICtrlListView_SetItemSelected($soundList, $soundItemIndex)
		ControlClick("Sound","","[Class:Button;Instance:2]")
	EndIf


	WinClose("Sound")

EndFunc

Func getSoundItemByIndex($soundItems,$itemDesc)
	For $i = 0 To UBound($soundItems, $UBOUND_ROWS) - 1
		If $soundItems[$i][0] = $itemDesc Or $soundItems[$i][1] = $itemDesc Then
			Return $i - 1
		EndIf
	Next
	return -1
EndFunc

