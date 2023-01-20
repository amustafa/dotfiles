if [ "`uname -s`" = Darwin ]; then
    brew install semgrep
else
    python3 -m pip install semgrep
fi
