# TermuxSSHDsetup

Scripts and notes for setting up and using SSHd on your Android device using Termux so that you can SSH, SFTP, and SSHFS to your Android

# On your AndroidOS device 
  Install Termux (https://termux.com/)
  
  Launch Termux
  
  Enter this  command (automated install)
  
     > curl -sSL https://raw.githubusercontent.com/tomhiggins/TermuxSSHDsetup/master/termuxsshdsetup.sh | bash
 
 Or enter these commands (manual install)
 
     > apt update 
     
     > apt upgrade
     
     > termux-setup-storage
     
     > apt install openssh
     
     > touch ~/.ssh/authorized_keys
     
     > chmod 600 ~/.ssh/authorized_keys
     
     > chmod 700 ~/.ssh
     
     > ssh-keygen
     
     > cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
     
     > chmod 600 ~/.ssh/authorized_keys
     
     > sshd
	 	 
Move the need key to the remote host device you want to connect
to your Android from 

     > scp ~/.ssh/id_rsa name@remotehost.com:/path/of/id_rsa

# To SSH into Android from the Remote Host

   Type this command from within a Terminal

     > ssh -p 8022 -i /path/of/id_rsa IPofYourAndroid 

# To SFTP into Android from the Remote Host

  Type this command from within a Terminal

    > sftp -P 8022 -i /path/of/id_rsa IPofYourAndroid  
     
# To Mount to the Android/Termux Directories On the Remote Host Device

   Make sure you have SSHFS installed 
   Type this command

      >sshfs anything@IPofYourAndroid:/data/data/com.termux/files/home/ /path/on/remote/to/mount/ -p 8022 -o IdentityFile=/path/of/id_rsa
   
   Once Mounted you can access the files and directoris on the Android device from any app/program (example, file managers, Atom editor, Libre Office, etc etc)
		
# To Mount to the Android/Termux Directories from a Chromebook / ChromeOS

- Install the SFTP File System service if you do not already have it
- Select the SFTP File System  
![alt tag](https://github.com/tomhiggins/TermuxSSHDsetup/blob/master/Screenshot%202017-04-29%20at%205.17.20%20PM.png)

- Fill in the options
  - The Hostname/IP is the IP of the Android
  - The portnumber is 8022
  - Select the PublicKey option
  - You do not need to fill in Username or Password
  - Paste the contents of id_rsa into the Private Key field
  - Set the Path to /data/data/com.termux/files/  for the Termux filespace
                   or /storage/emulated/0 for the shared Android filespace
  - Click on Mount
![alt tag](https://github.com/tomhiggins/TermuxSSHDsetup/blob/master/Screenshot%202017-04-29%20at%205.19.48%20PM.png)

- Enjoy 
![alt tag](https://github.com/tomhiggins/TermuxSSHDsetup/blob/master/Screenshot%202017-04-29%20at%205.21.09%20PM.png)

# Links to sources
   SSH Under Termux - https://oliverse.ch/tech/2015/11/06/run-an-ssh-server-on-your-android-with-termux.html
   
   Termux Storage and Shares - https://termux.com/storage.html
   
   Termux Help - https://termux.com/help.html
