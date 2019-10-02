;===============================================================================
;
; Function Name:   _GUICtrlListView_GetContents
; Description::    Captures Contents of a SysListView32 Contrl Into an Array
; Parameter(s):    $hWnd - Handle to the control
; Requirement(s):  #include <GUIListView.au3>
; Return Value(s): Success - Array with ListView Contents
;                  Failure - 0
; Author(s):       Paul Wilson (spudw2k)
;
;===============================================================================
Func _GUICtrlListView_GetContents($hWnd)
    $iCol = _GUICtrlListView_GetColumnCount($hWnd)
    If $iCol = 0 Then Return 0
    Dim $arrListView[1][$iCol]
    For $i = 0 to $iCol-1
        Local $Col=_GUICtrlListView_GetColumn($hWnd,$i)
        $arrListView[0][$i]=$Col[5]
    Next
    $Col = 0
    $iRows = _GUICtrlListView_GetItemCount($hWnd)
    For $i = 0 to $iRows-1
        Redim $arrListView[UBound($arrListView)+1][$iCol]
        $arrListView[UBound($arrListView)-1][0]=_GUICtrlListView_GetItemText($hWnd,$i)
        For $j = 1 To $iCol-1
            $arrListView[UBound($arrListView)-1][$j]=_GUICtrlListView_GetItemText($hWnd,$i,$j)
        Next
    Next
    $arrListView[0][0] = UBound($arrListView)-1
    Return $arrListView
EndFunc   ;==>_GUICtrlListView_GetContents
