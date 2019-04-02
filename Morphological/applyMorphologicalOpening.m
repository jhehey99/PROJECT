procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    bw = rgb2gray(procImg);
    r = str2double(handles.txt_radius.String);
    if (r < 2)
        showMsgBox('Value must be Greater than 2', 'Error', 'error');
        return;    
    end
    se = strel('disk',r);
    handles.procImg = imopen(bw,se);
    displayImage;
    guidata(hObject, handles);
end