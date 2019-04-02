imgToSave = handles.procImg;

if isequal(imgToSave, 0)
    showMsgBox('No image to save', 'Warning', 'warn');
else
    [file path]= uiputfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'},'Save Image as');
    save=[path file]; 
    imwrite(imgToSave,save);
end
