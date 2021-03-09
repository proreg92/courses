gcloud compute instances create reddit2-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=f1-micro \
  --tags puma-server \
  --restart-on-failure
  
  NAME        ZONE            MACHINE_TYPE  PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
reddit-app  europe-west1-b  f1-micro                   10.132.0.15  34.76.149.235  RUNNING

NAME         ZONE            MACHINE_TYPE  PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP  STATUS
reddit2-app  europe-west1-b  f1-micro                   10.132.0.16  34.76.43.16  RUNNING





setupvpn.sh
cat <<EOF> setupvpn.sh
#!/bin/bash
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.4.list
echo "deb http://repo.pritunl.com/stable/apt xenial main" > /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 0C49F3730359A14518585931BC711F9BA15703C6
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
apt-get --assume-yes update
apt-get --assume-yes upgrade
apt-get --assume-yes install pritunl mongodb-org
systemctl start pritunl mongod
systemctl enable pritunl mongod
EOF


cat <<EOF> install_ruby.sh
#!/bin/bash
apt update
apt install -y ruby-full ruby-bundler build-essential
EOF

Check:
ruby -v
bundle -v


cat <<EOF> install_mongodb.sh
#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
EOF

Check:
sudo systemctl status mongod


cat <<EOF> deploy.sh
#!/bin/bash
git clone https://github.com/Otus-DevOps-2017-11/reddit.gitruby
cd reddit && bundle install
puma -d
EOF

Check:
ps aux | grep puma


cat <<EOF> startup.sh
#!/bin/bash
# install ruby
apt update
apt install -y ruby-full ruby-bundler build-essential
# install mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
#install reddit-app
git clone https://github.com/Otus-DevOps-2017-11/reddit.git
cd reddit && bundle install
puma -d
EOF

Startup-script.sh
gcloud compute instances create reddit3-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=f1-micro \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='wget -O -  https://gist.githubusercontent.com/proreg92/3e941a6bd29d215fcc8a1cc5fa240a50/raw/ee1cdaaf2e99a14c98a102d56942e7d9c86c4871/startup.sh | bash'
