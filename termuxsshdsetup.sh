# A script to set up sshd into a termux install.
#
apt update
apt upgrade
termux-setup-storage
apt install openssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
sshd
termux-open-url https://slack-files.com/T03HE7X7P-F5611A1BP-2bdfa699f8
