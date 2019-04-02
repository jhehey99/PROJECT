procImg = handles.origImg;
if isequal(procImg, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    handles.isIndex = 1;
    qcolors = handles.index_qcolors;
    [handles.procImg, handles.map] = rgb2ind(procImg, qcolors);
    axes(handles.axes_new); cla;
    imagesc(handles.procImg);
    colormap(handles.map);
    axis off;
    guidata(hObject, handles);
end