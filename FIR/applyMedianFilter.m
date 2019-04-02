procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    procImg = rgb2gray(handles.origImg);
    handles.procImg = medfilt2(procImg);
    displayImage;
    guidata(hObject, handles);
end