function enable_site() {
  SITE_NAME="$1"
  sudo cp "./nginx.sites/$SITE_NAME" "/etc/nginx/sites-available/$SITE_NAME"
  sudo ln -f -s "/etc/nginx/sites-available/$SITE_NAME" \
                "/etc/nginx/sites-enabled/$SITE_NAME"

}

sudo rm /etc/nginx/sites-available/*
sudo rm /etc/nginx/sites-enabled/*
enable_site peterdowns.com
enable_site bookshrink.com
enable_site freezine.xyz
enable_site catchall_redirect
#make_available ./nginx.sites/peterdowns.com
#make_available ./
#
#sudo cp ./nginx.sites/peterdowns.com /etc/nginx/sites-available/peterdowns.com 
#sudo ln -f -s /etc/nginx/sites-available/peterdowns.com \
#              /etc/nginx/sites-enabled/peterdowns.com
#
#sudo cp ./nginx.sites/bitcoin.peterdowns.com /etc/nginx/sites-available/bitcoin.peterdowns.com 
#sudo ln -f -s /etc/nginx/sites-available/bitcoin.peterdowns.com \
#              /etc/nginx/sites-enabled/bitcoin.peterdowns.com
#
#sudo cp ./nginx.sites/bookshrink.com /etc/nginx/sites-available/bookshrink.com 
#sudo ln -f -s /etc/nginx/sites-available/bookshrink.com \
#              /etc/nginx/sites-enabled/bookshrink.com
#
#sudo cp ./nginx.sites/freezine.xyz /etc/nginx/sites-available/freezine.xyz 
#sudo ln -f -s /etc/nginx/sites-available/freezine.xyz \
#              /etc/nginx/sites-enabled/freezine.xyz
