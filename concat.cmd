set preset=slow
set filter=*.mp4
set outdir=v
set ratecontrol=vbr_hq
set avgbitrate=6M
set concatfile=concat.txt

del %concatfile%
FOR %%f IN (%filter%) DO echo file '%%f' >> %concatfile%



mkdir "%outdir%"


ffmpeg -f concat -safe 0 -i %concatfile% -c copy "%outdir%/concat_output.mp4"

@pause