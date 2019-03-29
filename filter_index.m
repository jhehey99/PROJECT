img_orig = handles.img_orig;
if isequal(img_orig, 0)
    showMsgBox('Please import an image', 'Warning', 'warn');
else
    qcolors = handles.index_qcolors;
    [handles.img_proc, map] = rgb2ind(img_orig, qcolors);
    display_image;
    guidata(hObject, handles)
end


