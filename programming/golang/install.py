import os
import sys
import re
import tarfile
import shutil
from distutils.version import LooseVersion
from pathlib import Path
import requests

ROOT_DIR = Path(__file__).resolve().parent
print(ROOT_DIR)

GOLANG_DL_PAGE_LINK = "https://golang.org/dl/"
regex = r"<h2 class=\"toggleButton\" title=\"Click to hide downloads for this version\">(?P<version>.*) ▾<\/h2>"

response = requests.get(GOLANG_DL_PAGE_LINK)
versions = [LooseVersion(m.groups()[0][2:]) for m in re.finditer(regex, response.text)]
current_version = max(versions)

UBUNTU_DL = f"https://dl.google.com/go/go{current_version}.linux-amd64.tar.gz"
MAC_DL = f"https://dl.google.com/go/go{current_version}.darwin-amd64.tar.gz"

DL_LINK = UBUNTU_DL if sys.platform == "linux" else MAC_DL
GOLANG_PACKAGE_FILENAME = ROOT_DIR / Path(DL_LINK.split("/")[-1])

print("Downloading from ", DL_LINK)
print("Saving to ", GOLANG_PACKAGE_FILENAME)
content = requests.get(DL_LINK)

with open(GOLANG_PACKAGE_FILENAME, 'wb') as f:
    f.write(content.content)

# Retrieve HTTP meta-data
print(content.status_code)
print(content.headers['content-type'])
print(content.encoding)

# Extract files
with tarfile.open(GOLANG_PACKAGE_FILENAME) as tar:
    def is_within_directory(directory, target):
    	
    	abs_directory = os.path.abspath(directory)
    	abs_target = os.path.abspath(target)
    
    	prefix = os.path.commonprefix([abs_directory, abs_target])
    	
    	return prefix == abs_directory
    
    def safe_extract(tar, path=".", members=None, *, numeric_owner=False):
    
    	for member in tar.getmembers():
    		member_path = os.path.join(path, member.name)
    		if not is_within_directory(path, member_path):
    			raise Exception("Attempted Path Traversal in Tar File")
    
    	tar.extractall(path, members, numeric_owner=numeric_owner) 
    	
    
    safe_extract(tar, path=ROOT_DIR)

# Delete Tar
os.remove(GOLANG_PACKAGE_FILENAME)

# move into place
GOPATH = os.environ["GOPATH"]
shutil.move(ROOT_DIR / 'go', GOPATH)


