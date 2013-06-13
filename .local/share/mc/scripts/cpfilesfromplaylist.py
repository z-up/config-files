#!/usr/bin/env python

import os, sys, shutil

def main():
    args = sys.argv[1:]
    if len(args) != 2:
        return False
    playlist_filename = args[0]
    dest_folder_name = args[1]
    if os.path.isfile(playlist_filename) and \
                    playlist_filename.lower().endswith(".m3u") and \
                    os.path.isdir(dest_folder_name):
        f = open(playlist_filename)
        lines = f.readlines()
        f.close()
        for s in [l for l in lines if not l.strip().startswith("#")]:
            song = s.strip()
            if os.path.isfile(song):
                print("copying %s\n" % song)
                shutil.copy2(song, dest_folder_name)


if __name__ == '__main__':
    main()

