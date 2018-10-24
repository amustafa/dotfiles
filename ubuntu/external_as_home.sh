#Taken from https://help.ubuntu.com/community/Partitioning/Home/Moving
cmp /etc/fstab /etc/fstab.$(date +%Y-%m-%d)

echo "UUID=$HOME_DRIVE_UUID   /media/home    ext3          defaults       0       2" >> /etc/fstab

sudo mkdir /media/home

sudo mount -a

sudo rsync -aXS --exclude='/*/.gvfs' /home/. /media/home/.
