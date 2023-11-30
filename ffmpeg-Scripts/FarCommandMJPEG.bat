echo Качество Q %FFMPEG-Q%
echo Кодек -c:v %FFMPEG-CV%
echo Параметры %FFMPEG-OPT%
echo Пост-пераметры %FFMPEG-POSTOPT%
set parm= %*
FOR %%x IN ( %* ) DO (
 echo %FFMPEG-PATH%ffmpeg.exe -i "%%~x" -c:v %FFMPEG-CV% -q:v %FFMPEG-Q% %FFMPEG-POSTOPT% -c:a copy -map 0"%%~nx Q%FFMPEG-Q%.%FFMPEG-EXT%"
 %FFMPEG-PATH%ffmpeg.exe -i "%%~x" -c:v %FFMPEG-CV% %FFMPEG-POSTOPT% -q:v %FFMPEG-Q% -c:a copy -map 0 "%%~nx Q%FFMPEG-Q%.%FFMPEG-EXT%"
)