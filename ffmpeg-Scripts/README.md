

LoopVideoToItself.ps1
Script makes video looped to itself, using crossfading (seamless looping last frame to begining). These scrypts are very handy with file managers(Far, TotalCommander)
Usage:
LoopVideoToItself.ps1 -filename <filename> -filenames <file-list> -ffmpeg_path <path to ffmpeg's bin folder>

FarMenu.ini 
Menu file for Far File manager. Very helpful when performing batch video-manipulation inside Far. 
Content of this file should be added to system menu of FarManager. To do this, just press F2, then Alt+F4 to edit main menu file

FarCommandMJPEG.bat
Batch File to use video convertation through CLI. Used in conjunction with FarMenu.ini file
To use this file directly you must set system ENV:
SET FFMPEG-Q=<0-32>     - Video quality 
SET FFMPEG-CV=          - Video-codec name (ex. h264_qsv mjpeg prores)
SET FFMPEG-OPT=         - Additional options(ex. "-hwaccel qsv" - to use QuickSync hardware encoding to h264 )