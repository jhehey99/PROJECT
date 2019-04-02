function varargout = main_form(varargin)
% MAIN_FORM MATLAB code for main_form.fig
%      MAIN_FORM, by itself, creates a new MAIN_FORM or raises the existing
%      singleton*.
%
%      H = MAIN_FORM returns the handle to a new MAIN_FORM or the handle to
%      the existing singleton*.
%
%      MAIN_FORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_FORM.M with the given input arguments.
%
%      MAIN_FORM('Property','Value',...) creates a new MAIN_FORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_form_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_form_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_form

% Last Modified by GUIDE v2.5 03-Apr-2019 02:41:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_form_OpeningFcn, ...
                   'gui_OutputFcn',  @main_form_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main_form is made visible.
function main_form_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_form (see VARARGIN)

% Choose default command line output for main_form
handles.output = hObject;

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('bgg.png'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');


% Update handles structure
guidata(hObject, handles);

% Main Form Initialization
main_form_init;

% UIWAIT makes main_form wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_form_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_import.
function btn_import_Callback(hObject, eventdata, handles)
% hObject    handle to btn_import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % import_image;
    importImage;

% --- Executes on button press in btn_display.
function btn_display_Callback(hObject, eventdata, handles)
% hObject    handle to btn_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    displayImage;
    


% --- Executes on button press in btn_clear.
function btn_clear_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    clearImages;


% --- Executes on button press in btn_reset.
function btn_reset_Callback(hObject, eventdata, handles)
% hObject    handle to btn_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    resetFilters;


% --- Executes on button press in btn_binary.
function btn_binary_Callback(hObject, eventdata, handles)
% hObject    handle to btn_binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    applyBinaryFilter;


% --- Executes on slider movement.
function sld_binlevel_Callback(hObject, eventdata, handles)
% hObject    handle to sld_binlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    handles.binLevel = get(hObject,'Value');
    onLevelSliderChanged;


% --- Executes during object creation, after setting all properties.
function sld_binlevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_binlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function txt_binlevel_Callback(hObject, eventdata, handles)
% hObject    handle to txt_binlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_binlevel as text
%        str2double(get(hObject,'String')) returns contents of txt_binlevel as a double
    level = str2double(get(hObject, 'String'));
    onLevelTextChanged;
    

% --- Executes on button press in btn_index.
function btn_index_Callback(hObject, eventdata, handles)
% hObject    handle to btn_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    applyIndexing;


    
    % --- Executes during object creation, after setting all properties.
function txt_binlevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_binlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on slider movement.
function sld_idxqcolor_Callback(hObject, eventdata, handles)
% hObject    handle to sld_idxqcolor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    handles.index_qcolors = floor(get(hObject,'Value'));
    set(handles.txt_idxqcolor, 'string', num2str(handles.index_qcolors));
    guidata(hObject, handles);
    applyIndexing;

% --- Executes during object creation, after setting all properties.
function sld_idxqcolor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_idxqcolor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txt_idxqcolor_Callback(hObject, eventdata, handles)
% hObject    handle to txt_idxqcolor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_idxqcolor as text
%        str2double(get(hObject,'String')) returns contents of txt_idxqcolor as a double
    handles.index_qcolors = str2double(get(hObject,'String'));
    set(handles.sld_idxqcolor, 'value', handles.index_qcolors);
    guidata(hObject, handles);
    applyIndexing;

% --- Executes during object creation, after setting all properties.
function txt_idxqcolor_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function txt_intLevel_Callback(hObject, eventdata, handles)
    handles.intLevel = str2double(handles.txt_intLevel.String);
    set(handles.sld_intensity, 'value', handles.intLevel);
    guidata(hObject, handles);
    applyIntensityFilter;

% --- Executes during object creation, after setting all properties.
function txt_intLevel_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sld_intensity_Callback(hObject, eventdata, handles)
    handles.intLevel = get(hObject,'Value');
    onIntensitySliderChanged;


% --- Executes during object creation, after setting all properties.
function sld_intensity_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_intensity.
function btn_intensity_Callback(hObject, eventdata, handles)
    applyIntensityFilter;


% --- Executes on button press in rb_intgray.
function rb_intgray_Callback(hObject, eventdata, handles)


% --- Executes on button press in rb_intrgb.
function rb_intrgb_Callback(hObject, eventdata, handles)



% --- Executes when selected object is changed in grp_int.
function grp_int_SelectionChangedFcn(hObject, eventdata, handles)
    handles.intType = get(handles.rb_intrgb, 'Value');
    guidata(hObject, handles);


% --- Executes on button press in btn_multi.
function btn_multi_Callback(hObject, eventdata, handles)
    applyMultiframe;

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function txt_multi_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of txt_multi as text
%        str2double(get(hObject,'String')) returns contents of txt_multi as a double
    handles.multiNum = str2double(get(hObject,'String'));

    if isnan(handles.multiNum)
        set(handles.txt_multi,'string','2');
        handles.multiNum = 2;
    elseif (handles.multiNum < 1)
        set(handles.txt_multi,'string','1');
        handles.multiNum = 1;
    end

    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function txt_multi_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sld_red_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    applyRgbFilter;

% --- Executes during object creation, after setting all properties.
function sld_red_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_green_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    applyRgbFilter;

% --- Executes during object creation, after setting all properties.
function sld_green_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_blue_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    applyRgbFilter;


% --- Executes during object creation, after setting all properties.
function sld_blue_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_subtract.
function btn_subtract_Callback(hObject, eventdata, handles)
    applyBackgroundSubtraction;


% --- Executes on slider movement.
function sld_contrast_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    applyContrastAdjustment;

% --- Executes during object creation, after setting all properties.
function sld_contrast_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_threshold_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    applyColorThresholding;

% --- Executes during object creation, after setting all properties.
function sld_threshold_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function txt_radius_Callback(hObject, eventdata, handles)
% hObject    handle to txt_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_radius as text
%        str2double(get(hObject,'String')) returns contents of txt_radius as a double


% --- Executes during object creation, after setting all properties.
function txt_radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_morph.
function btn_morph_Callback(hObject, eventdata, handles)
% hObject    handle to btn_morph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
applyMorphologicalOpening;



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sld_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to sld_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
applyGaussianFilter;

% --- Executes during object creation, after setting all properties.
function sld_sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txt_hsize_Callback(hObject, eventdata, handles)
% hObject    handle to txt_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_hsize as text
%        str2double(get(hObject,'String')) returns contents of txt_hsize as a double


% --- Executes during object creation, after setting all properties.
function txt_hsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_ave.
function btn_ave_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
applyAverageFilter;


function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_median.
function btn_median_Callback(hObject, eventdata, handles)
% hObject    handle to btn_median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
applyMedianFilter;


% --- Executes on slider movement.
function sld_strength_Callback(hObject, eventdata, handles)
% hObject    handle to sld_strength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
applySharpening;

% --- Executes during object creation, after setting all properties.
function sld_strength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_strength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_save.
function btn_save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveImage;
