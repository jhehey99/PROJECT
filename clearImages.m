% clear original, and processed images and clear axes

handles.origImg = 0;
handles.procImg = 0;
axes(handles.axes_orig); cla;
axes(handles.axes_new); cla;

resetRgbSliders;
guidata(hObject, handles);