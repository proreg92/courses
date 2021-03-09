gcloud compute instances create reddit3-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=f1-micro \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='wget -O -  https://gist.githubusercontent.com/proreg92/3e941a6bd29d215fcc8a1cc5fa240a50/raw/ee1cdaaf2e99a14c98a102d56942e7d9c86c4871/startup.sh | bash'
