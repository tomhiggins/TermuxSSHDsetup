#!/data/data/com.termux/files/usr/bin/bash
echo "Installing openssh"
apt install openssh
#genrating keys
ssh-keygen
echo "Your Key is now Genrated"
sleep 1
#changing permission of keys
echo "Changing permission of keys"
sleep 1
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
echo "Copying Key to sdcard"
cp ~/.ssh/id_rsa /sdcard
sleep 2
echo "Your key Is copied to sdcard"
echo "Now send the key to ssh client device"
echo "And move the key to home dir of termux"
#Starting SSH Server
sleep 2
echo "Starting SSH server"
sshd
sleep 1
echo "Done!"
Results = "$(whoami)"
echo "ssh ${Results}@IP -p 8022 -i $HOME/id_rsa"
echo "Now use the command above to ssh"
echo "into Termux."
echo "<<<<Script By T4P4N>>>>"
echo "Special Thanks to Neo-oli"
