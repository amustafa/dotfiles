# Install pyenv, add to path, build and install python, set python version

# Install Prereqs
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
DEPS_INSTALLED=""
if [ "`uname -s`" = Linux ]; then
    sudo apt-get install build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev
    DEPS_INSTALLED=TRUE
elif [ "`uname -s`" = Darwin ]; then
    brew install readline xz
    # sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
    DEPS_INSTALLED=TRUE
fi

