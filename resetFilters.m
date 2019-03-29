% clear processed image and display original

clear  handles.procImg;
axes(handles.axes_new); cla;
imshow(handles.img_orig);

resetRgbSliders;
