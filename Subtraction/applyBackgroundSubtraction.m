procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    str = strel('disk', 13); 
    bg = imopen(procImg, str); 
    handles.procImg = imsubtract(procImg, bg);
    displayImage;
    guidata(hObject, handles);
end