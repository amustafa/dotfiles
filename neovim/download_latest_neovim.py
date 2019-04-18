import requests
import os
import subprocess
import shutil
import re

neovim_latest_redirect_url = "https://github.com/neovim/neovim/releases/latest"
resp = requests.get(neovim_latest_redirect_url).text

if os.uname().sysname == "Linux":
    regex = r"neovim\/neovim\/releases\/download\/.*/nvim.appimage"
elif os.uname().sysname == "Darwin":
    regex = r"neovim\/neovim\/releases\/download\/.*/nvim-macos.tar.gz"

matches = re.finditer(regex, resp)

url = None
for matchNum, match in enumerate(matches, start=1):
    url = f"https://github.com/{match.group()}"
    break

print("Downloading: ", url)
subprocess.call(['wget', url])
