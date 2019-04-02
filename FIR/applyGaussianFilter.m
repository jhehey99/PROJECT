procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    procImg = rgb2gray(procImg);
    sigma = handles.sld_sigma.Value;
    handles.procImg = imgaussfilt(procImg, sigma);
    displayImage;
    guidata(hObject, handles);
end