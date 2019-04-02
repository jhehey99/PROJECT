procImg=handles.origImg;

if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    contrast = handles.sld_contrast.Value;

    % compute contrast adjustment factor
    fact=(259 * (contrast + 255)) / (255 * (259-contrast));

    % get rgb channels of image
    imgRed = procImg(:,:,1);
    imgGreen = procImg(:,:,2);
    imgBlue = procImg(:,:,3);

    % compute new rgb values
    newRed = fact * (imgRed - 128) + 128;
    newGreen = fact * (imgGreen - 128) + 128;
    newBlue = fact * (imgBlue - 128) + 128;

    handles.procImg = cat(3, newRed, newGreen, newBlue);

    displayImage;
    guidata(hObject, handles);
end