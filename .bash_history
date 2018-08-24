grep --include=\*.{py,js} -rni <pattern> .
grep --include=*.py -rni <pattern> .
find -iname "<pattern>" -exec cp {} </destination/folder> \;
find . -iname "*"
rename -n -- "s///" *
rename -n -- "s/^\d\./0$&/" *
rename -n -- "s/\ +/ /" *
for f in `ls IMG*`; do mv $f `echo $f | tr '[:upper:]' '[:lower:]'`; done
git status
git commit -a -m "update"
git commit -m "update"
git push origin master
git pull origin master
git reset --hard
killall -s KILL mplayer
ls -1
ls -1 | grep -i 
ls -1 | wc -l
ls -lh 
df -h
du -sh
cmake -DCMAKE_INSTALL_PREFIX=/home/sanya/sw/lmms -DCMAKE_BUILD_TYPE=DEBUG ..
