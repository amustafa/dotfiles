# Do not add python
cd git
zsh install.sh
cd ..


cd node
zsh node_install.sh
cd ..

cd rust
zsh install.sh
cd ..

# spark has no automated installer; install.sh is just a manual reminder
cat spark/install.sh

# DO NOT AUTO ADD CUDA
