# !/bin/bash
DATE=${DATE}
USER=$(whoami)
AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
AWS_ACCESS_KEY_SECRET=${AWS_ACCESS_KEY_SECRET}

echo "STARTING SERVER PREREQUISITES"
sudo apt update -y && sudo apt upgrade -y
sudo apt install unzip zip openjdk-16-jre apache2 screen -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" && aws configure set aws_secret_access_key "$AWS_ACCESS_KEY_SECRET" && aws configure set region "eu-west-2" && aws configure set output "text"
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo systemctl enable apache2
sudo /bin/bash -c 'echo "0 5 * * * $USER $HOME/minecraft-cuarentenacraft/scripts/backup.sh" >> /etc/crontab'
echo "FINISHED SERVER PREREQUISITES"
cat <<'EOF' >> $HOME/startup.sh
echo "STARTING SERVER CONFIG"
mkdir $HOME/backups
cd $HOME/backups
aws s3 cp s3://cuarentenacraft-backups/minecraft-server-$DATE.zip .
unzip minecraft-server-$DATE.zip
rm minecraft-server-$DATE.zip
mv minecraft-cuarentenacraft $HOME/
sudo cp -f $HOME/minecraft-cuarentenacraft/scripts/000-default.conf /etc/apache2/sites-available/
sudo systemctl restart apache2
echo "FINISHED SERVER CONFIG"
EOF