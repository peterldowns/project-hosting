sudo cp ./nginx.sites/peterdowns.com /etc/nginx/sites-available/peterdowns.com 
sudo cp ./nginx.sites/bitcoin.peterdowns.com /etc/nginx/sites-available/bitcoin.peterdowns.com 
sudo cp ./nginx.sites/bookshrink.com /etc/nginx/sites-available/bookshrink.com 
sudo cp ./nginx.sites/phood.club /etc/nginx/sites-available/phood.club
sudo ln -f -s /etc/nginx/sites-available/peterdowns.com \
              /etc/nginx/sites-enabled/peterdowns.com
sudo ln -f -s /etc/nginx/sites-available/bitcoin.peterdowns.com \
              /etc/nginx/sites-enabled/bitcoin.peterdowns.com
sudo ln -f -s /etc/nginx/sites-available/bookshrink.com \
              /etc/nginx/sites-enabled/bookshrink.com
sudo ln -f -s /etc/nginx/sites-available/phood.club\
              /etc/nginx/sites-enabled/phood.club
