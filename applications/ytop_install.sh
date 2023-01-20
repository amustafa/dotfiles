if [ "`uname -s`" = Darwin ]; then
    brew tap cjbassi/ytop
    brew install ytop
else
    cargo install ytop
fi
