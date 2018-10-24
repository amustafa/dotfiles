# dbxfs allows you to mount your Dropbox folder as if it were a local filesystem.
#https://github.com/rianhunter/dbxfs

sudo apt-get install libfuse2
pip3 install dbxfs
mkdir ~/Dropbox
dbxfs ~/Dropbox
dbxfs --print-default-config-file
