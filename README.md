### #########################################################################
##  CGminer 4.12.1 nerdaxe #
### #########################################################################

This is cgminer 4.12.1 with support for nerdaxe ultimate v1, nerdaxe pocket.

This software is forked from cgminer 4.10.0 original from ckolivas.

Then i added nerdaxe drivers

(you can refer to original documentation to docs/README)




to build this specific code on linux:

	sudo apt-get update -y
	sudo apt-get install build-essential autoconf automake libtool pkg-config libcurl4-openssl-dev libudev-dev \
	libjansson-dev libncurses5-dev libusb-1.0-0-dev zlib1g-dev git -y

	git clone https://github.com/nerdaxe/cgminer-nerdaxe.git

	cd cgminer-nerdaxe
	sudo usermod -a -G dialout,plugdev $USER
	sudo cp 01-cgminer.rules /etc/udev/rules.d/
	CFLAGS="-O2 -march=native" ./autogen.sh
	./configure --enable-nerdaxe
	make
	sudo make install
	sudo reboot
	
### Option Summary ###

```
  --nerdaxe-freq <clock>   Chip clock speed (MHz) default is 200 Mhz
  --suggest-diff <value> Limit diff for starting mine default is 32
```

### Command line ###

```
 ./cgminer -o pool_url -u username -p password --nerdaxe-freq 200 
```

For windows users, you can donwload the release zip file

Inside you can find a cgminer_run.bat file and you can adjust you settings.

### Nicehash extranonce support ##

You can use your miner with last extranonce support for nicehash by adding #xnsub at the address end, like this:

	./cgminer -o stratum+tcp://sha256.eu.nicehash.com:3334#xnsub -u my_btc_address -p x --nerdaxe-freq 200

### For Raspberry Users : ###

You may need to use "legacy" version of raspberry OS (32 or 64 bit no matter).


