#!/usr/bin/env python
"""Usage cpfilesfromplaylist <playlist_file> <directory_to_copy_files_to>
"""

import os, sys, shutil, string


if __name__ == '__main__':
    args = sys.argv[1:]
    if len(args) != 2:
        print(__doc__)
        sys.exit(1)

    [filename, dirname] = args
    if not (os.path.isfile(filename) or os.path.isdir(dirname)):
        print(__doc__)
        sys.exit(1)

    with open(filename) as f:
        for song_file in map(string.strip, f.readlines()):
            if os.path.isfile(song_file):
                print("copying %s" % song_file)
                shutil.copy2(song_file, dirname)

