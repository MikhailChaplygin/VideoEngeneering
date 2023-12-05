param([String[]] $filenames,
     $fadedur,
     $ffmpeg_path)

foreach ($filename in $filenames)
{
    $f_inf = New-Object System.IO.FileInfo($filename)
    $duration = &($ffmpeg_path+"ffprobe.exe") -v error -show_entries format=duration -of csv=p=0 $filename
    $bitrate = &($ffmpeg_path+"ffprobe.exe") -v error -select_streams v:0 -show_entries stream=bit_rate -of csv=p=0 $filename

    Write-Output $bitrate

    if ($duration -gt 0)
    { 
        $ExecutionString = $($ffmpeg_path+"ffmpeg.exe")+' -loglevel info -i '+ $filename+ ' -filter_complex '+ `
            """[0]split[body][pre];
             [body]trim=$fadedur,setpts=PTS-STARTPTS[main];
             [pre]trim=duration=$fadedur,format=yuva420p,fade=d=$fadedur\:alpha=1,setpts=PTS+($($duration - $fadedur*2)/TB)[jt];
             [main][jt]overlay"" -an -b:v "+$bitrate+ ' '+`
             $($f_inf.DirectoryName+"\"+$f_inf.BaseName+"_l$fadedur"+$f_inf.Extension)
        Write-Output($ExecutionString)
        &($ExecutionString)
    }
}
