set preset=slow
set filter=*.mp4
set outdir=v
set ratecontrol=vbr_hq
set codec=hevc

set /p gpu_mode=GPU Mode(input Y)? 

if /i "%gpu_mode%" == "y" set gpu_arg=-hwaccel cuvid 
if /i "%gpu_mode%" == "y" set codec=hevc_nvenc
mkdir "%outdir%"

FOR %%f IN (%filter%) DO ffmpeg.exe %gpu_arg% -i "%%f" -pix_fmt p010le -c:v %codec% -preset %preset% -rc %ratecontrol% -b:v 6M -maxrate:v 10M -c:a aac -b:a 240k "%outdir%/%%f"