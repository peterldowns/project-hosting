wget 'https://download.libsodium.org/libsodium/releases/libsodium-1.0.6.tar.gz'
tar zxvf libsodium-1.0.6.tar.gz
cd libsodium-1.0.6
./configure
make && make install

sudo apt-get install -y libtool pkg-config build-essential autoconf automake uuid-dev build-essential
wget 'http://download.zeromq.org/zeromq-4.0.7.tar.gz'
tar zxvf zeromq-4.0.7.tar.gz
cd zeromq-4.0.7
./configure --with-libsodium
make && make install
