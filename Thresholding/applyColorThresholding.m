procImg = handles.origImg;


threshold = handles.sld_threshold.Value;

threshRGB = multithresh(procImg,7);
value = [0 threshRGB(2:end) threshold]; 
handles.procImg = imquantize(procImg, threshRGB, value);
displayImage;
guidata(hObject, handles);