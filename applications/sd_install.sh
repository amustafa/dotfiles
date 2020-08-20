if [ "`uname -s`" = Darwin ]; then
    brew install sd
else
    cargo install sd
fi
