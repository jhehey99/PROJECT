origImg = handles.origImg;
if isequal(origImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    level = handles.binLevel;
    handles.procImg = im2bw(origImg,level);
    displayImage;
    guidata(hObject, handles)
end