str = strel('disk', 13); 
bg = imopen(handles.origImg, str); 
handles.procImg = imsubtract(handles.origImg, bg);
displayImage;
guidata(hObject, handles);