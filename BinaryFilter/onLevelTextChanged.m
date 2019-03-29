
if level > 1
    showMsgBox('Value must be between 0 to 1', 'Error', 'error');
else 
    handles.binLevel = level;
    set(handles.sld_binlevel, 'value', handles.binLevel);
    guidata(hObject, handles);
    applyBinaryFilter;
end
