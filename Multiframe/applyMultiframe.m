
if (handles.procImg == 0)
    procImg = handles.origImg;
else
    procImg = handles.procImg;
end

k = handles.multiNum;
if (k==1)
    displayImage;
elseif (k>1)
    arr=repmat(procImg,[1 1 1 k]);
    axes(handles.axes_new);
    if (handles.isIndex == 1)
        procImg = montage(arr, handles.map);
        handles.isIndex = 0;
    else
        procImg = montage(arr);
    end
end

guidata(hObject, handles);

