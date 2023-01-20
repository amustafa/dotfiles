if [ "`uname -s`" = Darwin ]; then
    brew install procs
else
    sudo snap install procs
fi
