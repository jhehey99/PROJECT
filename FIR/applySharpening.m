procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    strength = handles.sld_strength.Value;
    handles.procImg = imsharpen(procImg, 'Amount', strength);
    displayImage;
    guidata(hObject, handles);
end