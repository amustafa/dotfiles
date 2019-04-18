import os
import subprocess
from configparser import ConfigParser

print("Running Installer")

config = ConfigParser()
config.read(["config.default.ini", "config.local.ini"])

OS_UNAME = os.uname().sysname
print(f"Os Type: {OS_UNAME}")
