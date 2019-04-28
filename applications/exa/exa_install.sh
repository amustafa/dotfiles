if [ "`uname -s`" = Darwin ]; then
    brew install exa
else
    cargo install exa
fi
