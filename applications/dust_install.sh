if [ "`uname -s`" = Darwin ]; then
    brew install dust
else
    cargo install dust
fi
