handles.isIndex = 1;
procImg = handles.origImg;
qcolors = handles.index_qcolors;
[handles.procImg, handles.map] = rgb2ind(procImg, qcolors);
axes(handles.axes_new); cla;
imagesc(handles.procImg);
colormap(handles.map);
axis off;
guidata(hObject, handles);