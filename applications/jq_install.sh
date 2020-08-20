if [ "`uname -s`" = Darwin ]; then
    brew install jq
else
    echo "Warning: jq install script not available."
fi
