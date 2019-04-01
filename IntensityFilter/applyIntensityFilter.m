
if (handles.intType == 1) % RGB Intensity
    I=handles.origImg;
    handles.procImg = apply(I, handles.intLevel);
    displayImage;
elseif (handles.intType == 0) % Grayscale Intensity
    I=rgb2gray(handles.origImg);
    handles.procImg = apply(I, handles.intLevel);
    displayImage;
end
guidata(hObject, handles);

function J = apply(I, n)
    Idouble = im2double(I); 
    avg = mean2(Idouble);
    sigma = std2(Idouble);

    l = avg-n*sigma;
    h = avg+n*sigma;

    J = imadjust(I,[l h],[]);
end