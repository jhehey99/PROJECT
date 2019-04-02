procImg = handles.origImg;

if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    threshold = handles.sld_threshold.Value;
    threshRGB = multithresh(procImg,7);
    value = [0 threshRGB(2:end) threshold]; 
    handles.procImg = imquantize(procImg, threshRGB, value);
    displayImage;
    guidata(hObject, handles);
end