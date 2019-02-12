# change username and password
USERNAME="ttt"
PASSWORD="ttt"

sudo apt-get install zsh
sudo useradd -m ${USERNAME} 
echo "${PASSWORD}" > /tmp/passwd.txt
echo "${PASSWORD}" >> /tmp/passwd.txt
sudo passwd ${USERNAME}  < /tmp/passwd.txt
sudo chsh -s /bin/zsh ${USERNAME} 
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /tmp/91-${USERNAME}-user
sudo cp /tmp/91-${USERNAME}-user /etc/sudoers.d/ -f
passwd_login=`cat /etc/ssh/sshd_config | grep -w "PasswordAuthentication yes"`

rm -rf /tmp/passwd.txt
rm -rf /tmp/91-${USERNAME}-user
