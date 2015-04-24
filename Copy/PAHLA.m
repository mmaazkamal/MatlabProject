

function varargout = PAHLA(varargin)


%PAHLA M-file for PAHLA.fig
%      PAHLA, by itself, creates a new PAHLA or raises the existing
%      singleton*.
%
%      H = PAHLA returns the handle to a new PAHLA or the handle to
%      the existing singleton*.
%
%      PAHLA('Property','Value',...) creates a new PAHLA using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to PAHLA_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PAHLA('CALLBACK') and PAHLA('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PAHLA.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PAHLA

% Last Modified by GUIDE v2.5 09-Mar-2015 21:19:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PAHLA_OpeningFcn, ...
                   'gui_OutputFcn',  @PAHLA_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before PAHLA is made visible.
function PAHLA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

stimeFlag=0;
stimeFlagLoop=0;
amp=.9;
Fs=48000;
pc=.1;
tc = [0:pc*Fs+1]/Fs;
Fc = 19900;% Carrier frequency
ysyn=amp*cos(2*pi*Fc*tc)';

setappdata(0,'ysyn',ysyn);
setappdata(0,'Fs',Fs);
setappdata(0,'stimeFlag',stimeFlag);
setappdata(0,'stimeFlagLoop',stimeFlagLoop);











% Choose default command line output for PAHLA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PAHLA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PAHLA_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;







% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


sname=uigetfile({'*.avi;*.mpg;*.png;*.gif;*.wav','All video Files';... % get file name
          '*.*','All Files' },'KAKA select ur file :p',...
          'C:\Users\kamal\Documents\MATLAB\');
 setappdata(0,'sname',sname);
      disp('hi'); % cout
      
      set(handles.waiting,'string','Please Wait While the Video is importing...');
 set(handles.filename,'string',sname); %display file name 
 pause(1)
 %% Extract Audio

 videoFReader = vision.VideoFileReader(sname ,'AudioOutputPort',true);
x=1;
i=1;
while ~isDone(videoFReader)
[videoFrame AUDIO]= step(videoFReader);
    audio(x:length(AUDIO)*i,1)=AUDIO(:,1);
    audio(x:length(AUDIO)*i,2)=AUDIO(:,2);
    x=length(AUDIO)*i+1;
    i=i+1;
end
release(videoFReader);
FSS=length(AUDIO)*videoFReader.info.VideoFrameRate;
%% Get audio in double!
damp=2;
wavwrite(audio,FSS, 'papa.wav');
[y, FSS]=wavread('papa.wav');               %read the file's data
y=y(:,1);
 setappdata(0,'y',y);
  setappdata(0,'yOriginal',y);
setappdata(0,'FSS',FSS);
 slength=length(y)/FSS;             % find the length of the file
setappdata(0,'slength',slength);
set(handles.length,'string',slength); % display the length of file
 t = [1:length(y)]'/FSS;
 setappdata(0,'t',t);
 set(handles.waiting,'string','');
plot(t,y);



function time1_Callback(hObject, eventdata, handles)
% hObject    handle to time1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time1 as text
%        str2double(get(hObject,'String')) returns contents of time1 as a double


% --- Executes during object creation, after setting all properties.
function time1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.






function timeCrashCatch(b)
cFlag=0;

stimeFlagLoop=getappdata(0,'stimeFlagLoop');

for i=1: length(stimeFlagLoop)
   if stimeFlagLoop(i)==str2double(b)
   cFlag=1;
   end
end
setappdata(0,'cFlag',cFlag);

% --- Executes on button press in embed.
function embed_Callback(hObject, eventdata, handles)
% hObject    handle to embed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


stime1=get(handles.time1,'string'); %get time1
timeCrashCatch(stime1);
if (getappdata(0,'cFlag')==0)
    
FSS = getappdata(0,'FSS');
ysyn=getappdata(0,'ysyn');
y=getappdata(0,'y');


setappdata(0,'stime1',stime1);
slength=get(handles.length,'string');


stimeFlag=getappdata(0,'stimeFlag');
stimeFlagLoop=getappdata(0,'stimeFlagLoop');
stimeFlag=stimeFlag+1;
setappdata(0,'stimeFlag',stimeFlag);
stimeFlagLoop(stimeFlag)=str2double(stime1);
setappdata(0,'stimeFlagLoop',stimeFlagLoop);



sindex=round((str2double(stime1)/str2double(slength))*length(y));
setappdata(0,'sindex',sindex);



 y(sindex:sindex+length(ysyn)-1)=y(sindex:sindex+length(ysyn)-1)+ysyn;
 setappdata(0,'y',y);
 t = [1:length(y)]'/FSS;
 
set(handles.time1,'string','');
 plot(t,y);

else
    
    
    h = msgbox('Something Went Wrong!');
    
end


%15.89

function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in revert.
function revert_Callback(hObject, eventdata, handles)
% hObject    handle to revert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

stimeFlag=0;
stimeFlagLoop=0;
setappdata(0,'stimeFlag',stimeFlag);
setappdata(0,'stimeFlagLoop',stimeFlagLoop);

yOriginal=getappdata(0,'yOriginal');
setappdata(0,'y',yOriginal);
y=getappdata(0,'y');
t=getappdata(0,'t');
plot(t,y)
set(handles.time1,'string','');

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in render.
function render_Callback(hObject, eventdata, handles)
% hObject    handle to render (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 set(handles.waiting,'string','Please Wait while Video is exporting');
 pause(1);
y=getappdata(0,'y');
FSS=getappdata(0,'FSS');
sname=getappdata(0,'sname');
wavwrite(y,FSS, 'papa2.wav');

videoFReader = vision.VideoFileReader(sname,'AudioOutputPort',true);
videoFWriter = vision.VideoFileWriter('Telenor (OUT).avi','FrameRate',videoFReader.info.VideoFrameRate,'AudioInputPort',true,'VideoCompressor','DV Video Encoder');
i=1;
x=1;
videoFWriter.VideoCompressor='DV Video Encoder';
while ~isDone(videoFReader)
%i=i+1;
[videoFrame, AUDIO]= step(videoFReader);
y2=y(x:length(AUDIO)*i);
% y(:,2)=audio1(x:length(AUDIO)*i,2);
step(videoFWriter, videoFrame,y2);
x=length(AUDIO)*i+1;
i=i+1;

end
release(videoFReader);
release(videoFWriter);


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
