# Latex

Texlive installation : 
----------------------

Download and unzip from the [site](ttps://www.tug.org/texlive/).
Run the install-tl script.

> Add /usr/local/texlive/2015/texmf-dist/doc/info to INFOPATH.
 Add /usr/local/texlive/2015/texmf-dist/doc/man to MANPATH
   (if not dynamically found).
 Most importantly, add /usr/local/texlive/2015/bin/x86_64-linux
 to your PATH for current and future sessions.

From console : 
```
export INFOPATH=$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man
export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-linux
```
In bashrc :
```
INFOPATH="$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info"
MANPATH="$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man"
PATH="$PATH:/usr/local/texlive/2015/bin/x86_64-linux"
```


References : 
 . [Texlive](ttps://www.tug.org/texlive/)

