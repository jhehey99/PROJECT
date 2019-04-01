% Paths
addpath BinaryFilter;
addpath IntensityFilter;
addpath Multiframe;
addpath RGB;
addpath Subtraction;
addpath Contrast;
addpath Thresholding;
addpath Morphological;
addpath IndexedImage;


% initial variables
handles.origImg = 0;
handles.procImg = 0;
handles.binLevel = 0;
handles.index_qcolors = 1;


% -- Intensity
handles.intType = 1; % RGB - 1; GRAY - 0
handles.intLevel = 0.01;

% -- Multiframe
handles.multiNum = 2;


% -- RGB Color
handles.red = 0;
handles.green = 0;
handles.blue = 0;

% -- Index
handles.isIndex = 0;

guidata(hObject, handles);

%%% axes %%%
set(handles.axes_orig,'Visible','off');
set(handles.axes_new,'Visible','off');


clc;