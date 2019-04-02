procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    procImg = rgb2gray(handles.origImg);
    hsize = str2double(handles.txt_hsize.String);
    handles.procImg = filter2(fspecial('average', hsize), procImg)/255;
    displayImage;
    guidata(hObject, handles);
end