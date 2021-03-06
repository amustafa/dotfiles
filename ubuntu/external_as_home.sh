#Taken from https://help.ubuntu.com/community/Partitioning/Home/Moving
cp /etc/fstab /etc/fstab.$(date +%Y-%m-%d)

echo "UUID=$HOME_DRIVE_UUID   /media/external_home    ext4          defaults       0       2" >> /etc/fstab

sudo mkdir /media/external_home

sudo mount -a

sudo rsync -aXS --exclude='/*/.gvfs' /home/. /media/home/.
