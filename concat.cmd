set preset=slow
set filter=*.mp4
set outdir=out
set ratecontrol=vbr_hq
set avgbitrate=6M

mkdir %outdir%

ffmpeg -f concat -safe 0 -i concat.txt -c copy %outdir%/concat_output.mp4

@pause