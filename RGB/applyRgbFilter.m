procImg=handles.origImg;

if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    % get rgb channels of image
    imgRed = procImg(:,:,1);
    imgGreen = procImg(:,:,2);
    imgBlue = procImg(:,:,3);

    % get slider values
    sliderRed = handles.sld_red.Value;
    sliderGreen = handles.sld_green.Value;
    sliderBlue = handles.sld_blue.Value;

    % compute new rgb values
    newRed = imgRed * sliderRed + sliderRed;
    newGreen = imgGreen * sliderGreen + sliderGreen;
    newBlue = imgBlue * sliderBlue + sliderBlue;

    handles.procImg = cat(3, newRed, newGreen, newBlue);
    displayImage;
    guidata(hObject, handles);
end