# Update & Upgrade termux
cp .termux/colors.properties ~/.termux/colors.properties
pkg update && pkg upgrade -y

# Install package
while read package; do
  if [ -n "$(dpkg-query -W --showformat='${Status}\n' $package)" ]
    then echo "$package Installed"
    else pkg install -y $package
  fi
done < termux-package.txt