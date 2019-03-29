% clear original, and processed images and clear axes

clear handles.origImg handles.procImg;
axes(handles.axes_orig); cla;
axes(handles.axes_new); cla;

resetRgbSliders;
