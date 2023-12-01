These scrypts are very handy when using with file managers(Far, TotalCommander) as system menu commands. Just create new menu item in your filemanager to use these scrypts, or you can also find already existing presets here(FarMenu.ini). 
I use it to perform batch conversions to MJPeg, Prores, H264(with hardware encoding accelration - QuickSync). You can define your own presets, by changing codecname(read next).
Additional notes:
To execute Powershell scrypts, you can use this: 
    powershell.exe loopvideo.ps1 <arguments>

LoopVideoToItself.ps1
Script makes video looped to itself, using crossfading (seamless looping last frame to begining). 
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