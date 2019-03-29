
handles.procImg=handles.origImg;
k = handles.multiNum;
if (k==1)
    displayImage;
elseif (k>1)
    arr=repmat(handles.procImg,[1 1 1 k]);
    axes(handles.axes_new);
    handles.procImg = montage(arr);
end

guidata(hObject, handles);

