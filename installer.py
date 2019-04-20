import os
import subprocess
from configparser import ConfigParser

print(__file__)
DOTFILES_ROOT = os.path.dirname(__file__) or "."

print(f"Running Installer at {DOTFILES_ROOT}")

config = ConfigParser()
config.read(["config.default.ini", "config.local.ini"])

OS_UNAME = os.uname().sysname
print(f"Os Type: {OS_UNAME}")

# Install ZSH
zsh_script = f"zsh/install.sh"
print("Running zsh script")
subprocess.call(["zsh", zsh_script])
print("Sourcing zshrc")
subprocess.call(["source", "~/.zshrc"])
