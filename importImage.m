% opens file browser and user selects an image

%    [file, path] = uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Import Image');

%   if isequal(file,0) || isequal(path,0)
%        disp('Import Image Canceled')
%    else
%        handles.img_orig = imread(file);
%        axes(handles.axes_orig);
%        imshow(handles.img_orig);
%        guidata(hObject, handles);
%    end


handles.origImg = imread('cardinal.jpg');
axes(handles.axes_orig);
imshow(handles.origImg);
guidata(hObject, handles);
