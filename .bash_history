python -m smtpd -n -c DebuggingServer localhost:1025
grep --include=\*.{py,js} -rni <pattern> .
grep --include=*.py -rni <pattern> .
find -iname "<pattern>" -exec cp {} </destination/folder> \;
rename -n -- 's///' *
rename -- 's/^\d\./0$&/' *
rename -- 's/\ +/ /' *
for f in `ls IMG*`; do mv $f `echo $f | tr '[:upper:]' '[:lower:]'`; done
git status
git commit -a -m "update"
git commit -m "update"
git push origin master
git reset --hard
killall -s KILL mplayer
rebar get-deps compile
ls -1 | grep -i
youtube-dl -citw ytuser:TheAlphalete
df -h
du -sh
ps aux | grep 
ffmpeg -i CDImage.ape -f wav - | lame - CDImage.mp3
ffmpeg -i CDImage.ape CDImage.flac
cuebreakpoints CDImage.cue | shnsplit -o flac CDImage.flac
grep '<dt id="' *html | sed -e "s/^.\+html:<dt id=\"//; s/\">$//" | sort > blender_pydiction.txt
