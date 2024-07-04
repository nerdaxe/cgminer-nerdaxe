This is a multi-threaded multi-pool FPGA and ASIC miner for bitcoin.

This code is provided entirely free of charge by it's programmers.

If you wish to support it, simply mine at https://kano.is/

This code is licensed under the GPLv3. This means that the source to any
modifications you make to this code MUST be provided by law if you distribute
modified binaries. See COPYING for details.


Search below for the following headings for details about mining

EXECUTIVE SUMMARY ON USAGE
BUILDING CGMINER FOR YOURSELF
 If building from git
 If building on Ubuntu
 Basic *nix build instructions
 Building on Windows10
 Building on MacOS
Usage instructions
SETTING UP USB DEVICES on WINDOWS/LINUX/OSX
 WINDOWS
 LINUX
 OSX
 Advanced USB options
SCREEN DISPLAY WHILE RUNNING
MULTIPLE POOL CONNECTIONS
 QUOTAS
LOGGING
FAQ


GIT TREE:

https://github.com/kanoi/cgminer

SEE ALSO API-README, ASIC-README and FGPA-README FOR MORE INFORMATION ON EACH.

---

EXECUTIVE SUMMARY ON USAGE:

Single pool:

cgminer -o stratum+tcp://pool:port -u username -p password

Multiple pools:

cgminer -o stratum+tcp://pool1:port -u pool1username -p pool1password -o stratum+tcp://pool2:port -u pool2usernmae -p pool2password

Single pool with a standard http proxy:

cgminer -o "http:proxy:port|stratum+tcp://pool:port" -u username -p password

Single pool with a socks5 proxy:

cgminer -o "socks5:proxy:port|stratum+tcp://pool:port" -u username -p password

Single pool with stratum protocol support:

cgminer -o stratum+tcp://pool:port -u username -p password

Solo mining to local bitcoind:

cgminer -o http://localhost:8332 -u username -p password --btc-address 15qSxP1SQcUX3o4nhkfdbgyoWEFMomJ4rZ

The list of proxy types are:
 http:    standard http 1.1 proxy
 http0:   http 1.0 proxy
 socks4:  socks4 proxy
 socks5:  socks5 proxy
 socks4a: socks4a proxy
 socks5h: socks5 proxy using a hostname

If you compile cgminer with a version of CURL before 7.19.4 then some of the above will
not be available. All are available since CURL version 7.19.4

If you specify the --socks-proxy option to cgminer, it will only be applied to all pools
that don't specify their own proxy setting like above


After saving configuration from the menu, you do not need to give cgminer any
arguments and it will load your configuration.

Any configuration file may also contain a single
	"include" : "filename"
to recursively include another configuration file.
Writing the configuration will save all settings from all files in the output.

---

BUILDING CGMINER FOR YOURSELF

DEPENDENCIES:
Mandatory:
	pkg-config      http://www.freedesktop.org/wiki/Software/pkg-config
	libtool         http://www.gnu.org/software/libtool/
Optional:
	curl dev library        http://curl.haxx.se/libcurl/
	(libcurl4-openssl-dev - Must tell configure --disable-libcurl otherwise
	it will attempt to compile it in)

	curses dev library
	(libncurses5-dev or libpdcurses on WIN32 for text user interface)

	libusb-1 dev library (libusb-1.0-0-dev)
	(This is only required for USB device support)

	libudev dev library (libudev-dev)
	(This is only required for USB device support and is linux only)

	uthash dev (uthash-dev)
	Will use a copy included with the source if unavailable.

	libjansson dev (libjansson-dev)
	Will use a copy included with the source if unavailable.

If building from git:
	git           (of course)
	autoconf
	automake

If building on Ubuntu:
	sudo apt-get install build-essential autoconf automake libtool \
                             pkg-config libcurl4-openssl-dev libudev-dev \
                             libusb-1.0-0-dev libncurses5-dev zlib1g-dev git

CGMiner specific configuration options:
  --enable-ants1          Compile support for Antminer S1 Bitmain (default
                          disabled)
  --enable-ants2          Compile support for Antminer S2 Bitmain (default
                          disabled)
  --enable-avalon         Compile support for Avalon (default disabled)
  --enable-avalon2        Compile support for Avalon2/3 (default disabled)
  --enable-avalon4        Compile support for Avalon4/4.1/6 (default disabled)
  --enable-avalon7        Compile support for Avalon7 (default disabled)
  --enable-avalon8        Compile support for Avalon8 (default disabled)
  --enable-bab            Compile support for BlackArrow Bitfury (default
                          disabled)
  --enable-bflsc          Compile support for BFL ASICs (default disabled)
  --enable-bitforce       Compile support for BitForce FPGAs (default
                          disabled)
  --enable-bitfury        Compile support for BitFury ASICs (default disabled)
  --enable-bitmine_A1     Compile support for Bitmine.ch A1 ASICs (default
                          disabled)
  --enable-blockerupter   Compile support for ASICMINER BlockErupter Tube/Prisma
                          (default disabled)
  --enable-cointerra      Compile support for Cointerra ASICs (default disabled)
  --enable-drillbit       Compile support for Drillbit BitFury ASICs (default
                          disabled)
  --enable-gekko          Compile support for GekkoScience (default disabled)
  --enable-hashfast       Compile support for Hashfast (default disabled)
  --enable-icarus         Compile support for Icarus (default disabled)
  --enable-klondike       Compile support for Klondike (default disabled)
  --enable-knc            Compile support for KnC miners (default disabled)
  --enable-minion         Compile support for Minion BlackArrow ASIC (default
                          disabled)
  --enable-modminer       Compile support for ModMiner FPGAs(default disabled)
  --enable-sp10           Compile support for Spondoolies SP10 (default
                          disabled)
  --enable-sp30           Compile support for Spondoolies SP30 (default
                          disabled)
  --disable-libcurl       Disable building with libcurl for GBT support
  --enable-libsystemd     Compile support for system watchdog and status
                          notifications (default disabled)
  --without-curses        Compile support for curses TUI (default enabled)
  --with-system-libusb    Compile against dynamic system libusb (default use
                          included static libusb)
  --with-system-jansson   Compile against dynamic system jansson (default use
                          included static jansson)

Basic *nix build instructions:
	To actually build:

	./autogen.sh	# only needed if building from git repo
	CFLAGS="-O2 -Wall -march=native -fcommon" ./configure <options>
	make

	No installation is necessary. You may run cgminer from the build
	directory directly, but you may do make install if you wish to install
	cgminer to a system location or location you specified.


Building on Windows10:

see windows-build.txt


Building on MacOS

see mac-build.txt

---

Usage instructions:  Run "cgminer --help" to see options:

Usage: cgminer [-DdElmpPQqUsTouOchnV]

Options for both config file and command line:
--anu-freq <arg>    Set AntminerU1/2 frequency in MHz, range 125-500 (default: 250.0)
--api-allow <arg>   Allow API access only to the given list of [G:]IP[/Prefix] addresses[/subnets]
--api-description <arg> Description placed in the API status header, default: cgminer version
--api-groups <arg>  API one letter groups G:cmd:cmd[,P:cmd:*...] defining the cmds a groups can use
--api-listen        Enable API, default: disabled
--api-mcast         Enable API Multicast listener, default: disabled
--api-mcast-addr <arg> API Multicast listen address
--api-mcast-code <arg> Code expected in the API Multicast message, don't use '-'
--api-mcast-des <arg> Description appended to the API Multicast reply, default: ''
--api-mcast-port <arg> API Multicast listen port (default: 4028)
--api-network       Allow API (if enabled) to listen on/for any address, default: only 127.0.0.1
--api-port <arg>    Port number of miner API (default: 4028)
--au3-freq <arg>    Set AntminerU3 frequency in MHz, range 100-250 (default: 225.0)
--au3-volt <arg>    Set AntminerU3 voltage in mv, range 725-850, 0 to not set (default: 775)
--avalon-auto       Adjust avalon overclock frequency dynamically for best hashrate
--avalon-cutoff <arg> Set avalon overheat cut off temperature (default: 60)
--avalon-fan <arg>  Set fanspeed percentage for avalon, single value or range (default: 20-100)
--avalon-freq <arg> Set frequency range for avalon-auto, single value or range
--avalon-options <arg> Set avalon options baud:miners:asic:timeout:freq:tech
--avalon-temp <arg> Set avalon target temperature (default: 50)
--avalon2-freq      Set frequency range for Avalon2, single value or range
--avalon2-voltage   Set Avalon2 core voltage, in millivolts
--avalon2-fan       Set Avalon2 target fan speed
--avalon2-cutoff <arg> Set Avalon2 overheat cut off temperature (default: 88)
--avalon2-fixed-speed Set Avalon2 fan to fixed speed
--avalon4-automatic-voltage Automatic adjust voltage base on module DH
--avalon4-voltage   Set Avalon4 core voltage, in millivolts, step: 125
--avalon4-freq      Set frequency for Avalon4, 1 to 3 values, example: 445:385:370
--avalon4-fan       Set Avalon4 target fan speed range
--avalon4-temp <arg> Set Avalon4 target temperature (default: 42)
--avalon4-cutoff <arg> Set Avalon4 overheat cut off temperature (default: 65)
--avalon4-polling-delay <arg> Set Avalon4 polling delay value (ms) (default: 20)
--avalon4-ntime-offset <arg> Set Avalon4 MM ntime rolling max offset (default: 4)
--avalon4-aucspeed <arg> Set Avalon4 AUC IIC bus speed (default: 400000)
--avalon4-aucxdelay <arg> Set Avalon4 AUC IIC xfer read delay, 4800 ~= 1ms (default: 9600)
--avalon4-miningmode <arg> Set Avalon4 mining mode(0:custom, 1:eco, 2:normal, 3:turbo (default: 0)
--avalon4-freezesafe Make Avalon4 running as a radiator when stratum server failed
--avalon4-ntcb <arg> Set Avalon4 MM NTC B value (default: 3450)
--avalon4-freq-min <arg> Set minimum frequency for Avalon4 (default: 100)
--avalon4-freq-max <arg> Set maximum frequency for Avalon4 (default: 1000)
--avalon4-noncecheck-off Disable A3218 inside nonce check function
--avalon4-smart-speed <arg> Set smart speed, range 0-3. 0 means Disable (default: 2)
--avalon4-speed-bingo <arg> Set A3218 speed bingo for smart speed mode 1 (default: 255)
--avalon4-speed-error <arg> Set A3218 speed error for smart speed mode 1 (default: 3)
--avalon4-least-pll <arg> Set least pll check threshold for smart speed mode 2 (default: 768)
--avalon4-most-pll <arg> Set most pll check threshold for smart speed mode 2 (default: 256)
--avalon7-voltage   Set Avalon7 default core voltage, in millivolts, step: 78
--avalon7-voltage-level Set Avalon7 default level of core voltage, range:[0, 15], step: 1
--avalon7-voltage-offset Set Avalon7 default offset of core voltage, range:[-2, 1], step: 1
--avalon7-freq      Set Avalon7 default frequency, range:[24, 1404], step: 12, example: 500
--avalon7-freq-sel <arg> Set Avalon7 default frequency select, range:[0, 5], step: 1, example: 3 (default: 0)
--avalon7-fan       Set Avalon7 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalon7-temp <arg> Set Avalon7 target temperature, range:[0, 100] (default: 99)
--avalon7-polling-delay <arg> Set Avalon7 polling delay value (ms) (default: 20)
--avalon7-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalon7-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 19200)
--avalon7-smart-speed <arg> Set Avalon7 smart speed, range 0-1. 0 means Disable (default: 1)
--avalon7-th-pass <arg> Set A3212 th pass value (default: 162)
--avalon7-th-fail <arg> Set A3212 th fail value (default: 10921)
--avalon7-th-init <arg> Set A3212 th init value (default: 32767)
--avalon7-th-ms <arg> Set A3212 th ms value (default: 1)
--avalon7-th-timeout <arg> Set A3212 th timeout value (default: 0)
--avalon7-iic-detect Enable Avalon7 detect through iic controller
--avalon7-freqadj-time <arg> Set Avalon7 check interval when run in AVA7_FREQ_TEMPADJ_MODE (default: 60)
--avalon7-delta-temp <arg> Set Avalon7 delta temperature when reset freq in AVA7_FREQ_TEMPADJ_MODE (default: 0)
--avalon7-delta-freq <arg> Set Avalon7 delta freq when adjust freq in AVA7_FREQ_TEMPADJ_MODE (default: 100)
--avalon7-freqadj-temp <arg> Set Avalon7 check temperature when run into AVA7_FREQ_TEMPADJ_MODE (default: 104)
--avalon7-nonce-mask <arg> Set A3212 nonce mask, range 24-32. (default: 31)
--no-avalon7-asic-debug Disable A3212 debug.
--avalon8-voltage-level Set Avalon8 default level of core voltage, range:[0, 15], step: 1
--avalon8-voltage-level-offset Set Avalon8 default offset of core voltage level, range:[-2, 1], step: 1
--avalon8-freq      Set Avalon8 default frequency, range:[25, 1200], step: 25, example: 800
--avalon8-freq-sel <arg> Set Avalon8 default frequency select, range:[0, 3], step: 1, example: 3 (default: 3)
--avalon8-fan       Set Avalon8 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalon8-temp <arg> Set Avalon8 target temperature, range:[0, 100] (default: 90)
--avalon8-polling-delay <arg> Set Avalon8 polling delay value (ms) (default: 20)
--avalon8-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalon8-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 19200)
--avalon8-smart-speed <arg> Set Avalon8 smart speed, range 0-1. 0 means Disable (default: 1)
--avalon8-th-pass <arg> Set A3210 th pass value (default: -1)
--avalon8-th-fail <arg> Set A3210 th fail value (default: -1)
--avalon8-th-init <arg> Set A3210 th init value (default: 32767)
--avalon8-th-ms <arg> Set A3210 th ms value (default: 5)
--avalon8-th-timeout <arg> Set A3210 th timeout value (default: 4294967295)
--avalon8-th-add <arg> Set A3210 th add value (default: 1)
--avalon8-iic-detect Enable Avalon8 detect through iic controller
--avalon8-nonce-mask <arg> Set A3210 nonce mask, range 24-32. (default: -1)
--avalon8-nonce-check <arg> Set A3210 nonce check, range 0-1. (default: 1)
--avalon8-roll-enable <arg> Set A3210 roll enable, range 0-1. (default: 1)
--avalon8-mux-l2h <arg> Set Avalon8 mux l2h, range 0-2. (default: 0)
--avalon8-mux-h2l <arg> Set Avalon8 mux h2l, range 0-1. (default: 1)
--avalon8-h2ltime0-spd <arg> Set Avalon8 h2ltime0 spd, range 0-255. (default: 3)
--avalon8-spdlow <arg> Set Avalon8 spdlow, range 0-3. (default: -1)
--avalon8-spdhigh <arg> Set Avalon8 spdhigh, range 0-3. (default: 3)
--avalon8-cinfo-asic Set Avalon8 cinfo asic index, range:[0, 25], step: 1
--avalon8-pid-p <arg> Set Avalon8 pid-p, range 0-9999. (default: 2)
--avalon8-pid-i <arg> Set Avalon8 pid-i, range 0-9999. (default: 5)
--avalon8-pid-d <arg> Set Avalon8 pid-d, range 0-9999. (default: 0)
--avalon9-voltage-level Set Avalon9 default level of core voltage, range:[0, 15], step: 1
--avalon9-voltage-level-offset Set Avalon9 default offset of core voltage level, range:[-2, 1], step: 1
--avalon9-freq      Set Avalon9 default frequency, range:[25, 1200], step: 25, example: 800
--avalon9-freq-sel <arg> Set Avalon9 default frequency select, range:[0, 7], step: 1, example: 7 (default: 7)
--avalon9-fan       Set Avalon9 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalon9-temp <arg> Set Avalon9 target temperature, range:[0, 100] (default: 93)
--avalon9-polling-delay <arg> Set Avalon9 polling delay value (ms) (default: 20)
--avalon9-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalon9-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 24000)
--avalon9-smart-speed <arg> Set Avalon9 smart speed, range 0-1. 0 means Disable (default: 1)
--avalon9-th-pass <arg> Set A3206 th pass value (default: 8)
--avalon9-th-fail <arg> Set A3206 th fail value (default: 1000)
--avalon9-th-init <arg> Set A3206 th init value (default: 32767)
--avalon9-th-ms <arg> Set A3206 th ms value (default: 2)
--avalon9-th-timeout <arg> Set A3206 th timeout value (default: 1550000)
--avalon9-th-add <arg> Set A3206 th add value (default: 0)
--avalon9-th-mssel <arg> Set A3206 th mssel value (default: 0)
--avalon9-lv2-th-add <arg> Set A3206 lv2 th add value (default: 0)
--avalon9-lv2-th-ms <arg> Set A3206 lv2 th ms value (default: 0)
--avalon9-lv3-th-add <arg> Set A3206 lv3 th add value (default: 0)
--avalon9-lv3-th-ms <arg> Set A3206 lv3 th ms value (default: 0)
--avalon9-lv4-th-add <arg> Set A3206 lv4 th add value (default: 0)
--avalon9-lv4-th-ms <arg> Set A3206 lv4 th ms value (default: 0)
--avalon9-lv5-th-add <arg> Set A3206 lv5 th add value (default: 0)
--avalon9-lv5-th-ms <arg> Set A3206 lv5 th ms value (default: 0)
--avalon9-lv6-th-add <arg> Set A3206 lv6 th add value (default: 0)
--avalon9-lv6-th-ms <arg> Set A3206 lv6 th ms value (default: 0)
--avalon9-lv7-th-add <arg> Set A3206 lv7 th add value (default: 0)
--avalon9-lv7-th-ms <arg> Set A3206 lv7 th ms value (default: 0)
--avalon9-iic-detect Enable Avalon9 detect through iic controller
--avalon9-nonce-mask <arg> Set A3206 nonce mask, range 24-32. (default: 24)
--avalon9-nonce-check <arg> Set A3206 nonce check, range 0-1. (default: 1)
--avalon9-roll-enable <arg> Set A3206 roll enable, range 0-1. (default: 1)
--avalon9-mux-l2h <arg> Set Avalon9 mux l2h, range 0-2. (default: 0)
--avalon9-mux-h2l <arg> Set Avalon9 mux h2l, range 0-1. (default: 1)
--avalon9-h2ltime0-spd <arg> Set Avalon9 h2ltime0 spd, range 0-255. (default: 3)
--avalon9-spdlow <arg> Set Avalon9 spdlow, range 0-7. (default: 0)
--avalon9-spdhigh <arg> Set Avalon9 spdhigh, range 0-7. (default: 7)
--avalon9-tbase <arg> Set Avalon9 tbase and use (0-8) bits, range 0-255. (default: 0)
--avalon9-pid-p <arg> Set Avalon9 pid-p, range 0-9999. (default: 1)
--avalon9-pid-i <arg> Set Avalon9 pid-i, range 0-9999. (default: 5)
--avalon9-pid-d <arg> Set Avalon9 pid-d, range 0-9999. (default: 0)
--avalon9-adjust-volt-info Set Avalon9 adjust volt info, range 0-9999
--avalonlc3-voltage-level Set Avalonlc3 default level of core voltage, range:[0, 31], step: 1
--avalonlc3-voltage-level-offset Set Avalonlc3 default offset of core voltage level, range:[-2, 1], step: 1
--avalonlc3-freq    Set Avalonlc3 default frequency, range:[25, 1200], step: 25, example: 800
--avalonlc3-freq-sel <arg> Set Avalonlc3 default frequency select, range:[0, 4], step: 1, example: 3 (default: 3)
--avalonlc3-fan     Set Avalonlc3 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalonlc3-temp <arg> Set Avalonlc3 target temperature, range:[0, 100] (default: 90)
--avalonlc3-polling-delay <arg> Set Avalonlc3 polling delay value (ms) (default: 20)
--avalonlc3-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalonlc3-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 19200)
--avalonlc3-smart-speed <arg> Set Avalonlc3 smart speed, range 0-1. 0 means Disable (default: 1)
--avalonlc3-th-pass <arg> Set A3210M th pass value (default: 200)
--avalonlc3-th-fail <arg> Set A3210M th fail value (default: 7000)
--avalonlc3-th-init <arg> Set A3210M th init value (default: 32767)
--avalonlc3-th-ms <arg> Set A3210M th ms value (default: 5)
--avalonlc3-th-timeout <arg> Set A3210M th timeout value (default: 16000)
--avalonlc3-th-add <arg> Set A3210M th add value (default: 1)
--avalonlc3-iic-detect Enable Avalonlc3 detect through iic controller
--avalonlc3-nonce-mask <arg> Set A3210M nonce mask, range 24-32. (default: 27)
--avalonlc3-nonce-check <arg> Set A3210M nonce check, range 0-1. (default: 1)
--avalonlc3-roll-enable <arg> Set A3210M roll enable, range 0-1. (default: 1)
--avalonlc3-mux-l2h <arg> Set Avalonlc3 mux l2h, range 0-2. (default: 0)
--avalonlc3-mux-h2l <arg> Set Avalonlc3 mux h2l, range 0-1. (default: 1)
--avalonlc3-h2ltime0-spd <arg> Set Avalonlc3 h2ltime0 spd, range 0-255. (default: 3)
--avalonlc3-spdlow <arg> Set Avalonlc3 spdlow, range 0-3. (default: 2)
--avalonlc3-spdhigh <arg> Set Avalonlc3 spdhigh, range 0-3. (default: 3)
--avalonlc3-tbase <arg> Set Avalonlc3 tbase and use (0-8) bits, range 0-255. (default: 0)
--avalonlc3-cinfo-asic Set Avalonlc3 cinfo asic index, range:[0, 25], step: 1
--avalonlc3-pid-p <arg> Set Avalonlc3 pid-p, range 0-9999. (default: 2)
--avalonlc3-pid-i <arg> Set Avalonlc3 pid-i, range 0-9999. (default: 5)
--avalonlc3-pid-d <arg> Set Avalonlc3 pid-d, range 0-9999. (default: 0)
--bab-options <arg> Set BaB options max:def:min:up:down:hz:delay:trf
--balance           Change multipool strategy from failover to even share balance
--benchfile <arg>   Run cgminer in benchmark mode using a work file - produces no shares
--benchfile-display Display each benchfile nonce found
--benchmark         Run cgminer in benchmark mode - produces no shares
--bet-clk <arg>     Set clockspeed of ASICMINER Tube/Prisma to (arg+1)*10MHz (default: 23)
--bfl-range         Use nonce range on bitforce devices if supported
--bflsc-overheat <arg> Set overheat temperature where BFLSC devices throttle, 0 to disable (default: 85)
--bitburner-fury-voltage <arg> Set BitBurner Fury core voltage, in millivolts
--bitburner-fury-options <arg> Override avalon-options for BitBurner Fury boards baud:miners:asic:timeout:freq
--bitburner-voltage <arg> Set BitBurner (Avalon) core voltage, in millivolts
--bitmain-auto      Adjust bitmain overclock frequency dynamically for best hashrate
--bitmain-cutoff <arg> Set bitmain overheat cut off temperature
--bitmain-fan <arg> Set fanspeed percentage for bitmain, single value or range (default: 20-100)
--bitmain-freq <arg> Set bitmain freq options timeout:freq:regdata
--bitmain-hwerror   Set bitmain device detect hardware error
--bitmain-options <arg> Set bitmain options baud:miners:asic:timeout:freq:regdata
--bitmain-temp <arg> Set bitmain target temperature
--bitmain-workdelay <arg> Set bitmain work delay (ms) 0-100
--bitmain-voltage <arg> Set bitmain voltage - S2/S3 only
--bitmain-dev <arg> Set bitmain device - S2 only
--bitmainbeeper     Set bitmain beeper ringing
--bitmaintempoverctrl Set bitmain stop runing when temprerature is over 80 degree Celsius
--block-check       Run a block difficulty check of the binary then exit
--bxf-bits <arg>    Set max BXF/HXF bits for overclocking (default: 54)
--bxf-temp-target <arg> Set target temperature for BXF/HXF devices (default: 82)
--bxm-bits <arg>    Set BXM bits for overclocking (default: 54)
--btc-address <arg> Set bitcoin target address when solo mining to bitcoind
--btc-sig <arg>     Set signature to add to coinbase when solo mining (optional)
--compac-freq <arg> Set GekkoScience Compac frequency in MHz, range 100-500 (default: 150.0)
--compact           Use compact display without per device statistics
--debug|-D          Enable debug output
--decode            Decode 2nd pool stratum coinbase transactions (1st must be bitcoind) and exit
--disable-rejecting Automatically disable pools that continually reject shares
--dragonmint-t1-options <arg> Dragonmint T1 options ref_clk_khz:sys_clk_khz:spi_clk_khz:override_chip_num
--T1efficient       Tune Dragonmint T1 per chain voltage and frequency for optimal efficiency
--T1noauto          Disable Dragonmint T1 per chain auto voltage and frequency tuning
--T1performance     Tune Dragonmint T1 per chain voltage and frequency for maximum performance
--T1fantarget <arg> Throttle T1 frequency to keep fan less than target fan speed (default: 100)
--T1Pll1 <arg>      Set PLL Clock 1 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll2 <arg>      Set PLL Clock 2 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll3 <arg>      Set PLL Clock 3 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll4 <arg>      Set PLL Clock 4 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll5 <arg>      Set PLL Clock 5 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll6 <arg>      Set PLL Clock 6 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll7 <arg>      Set PLL Clock 7 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll8 <arg>      Set PLL Clock 8 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Volt1 <arg>     Dragonmint T1 set voltage 1 - VID overrides if set (390-425) (default: 404)
--T1Volt2 <arg>     Dragonmint T1 set voltage 2 - VID overrides if set (390-425) (default: 404)
--T1Volt3 <arg>     Dragonmint T1 set voltage 3 - VID overrides if set (390-425) (default: 404)
--T1Volt4 <arg>     Dragonmint T1 set voltage 4 - VID overrides if set (390-425) (default: 404)
--T1Volt5 <arg>     Dragonmint T1 set voltage 5 - VID overrides if set (390-425) (default: 404)
--T1Volt6 <arg>     Dragonmint T1 set voltage 6 - VID overrides if set (390-425) (default: 404)
--T1Volt7 <arg>     Dragonmint T1 set voltage 7 - VID overrides if set (390-425) (default: 404)
--T1Volt8 <arg>     Dragonmint T1 set voltage 8 - VID overrides if set (390-425) (default: 404)
--T1VID1 <arg>      Dragonmint T1 set VID 1 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID2 <arg>      Dragonmint T1 set VID 2 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID3 <arg>      Dragonmint T1 set VID 3 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID4 <arg>      Dragonmint T1 set VID 4 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID5 <arg>      Dragonmint T1 set VID 5 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID6 <arg>      Dragonmint T1 set VID 6 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID7 <arg>      Dragonmint T1 set VID 7 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID8 <arg>      Dragonmint T1 set VID 8 in noauto - Overrides voltage if set (1-31) (default: 0)
--drillbit-options <arg> Set drillbit options <int|ext>:clock[:clock_divider][:voltage]
--expiry|-E <arg>   Upper bound on how many seconds after getting work we consider a share from it stale (default: 120)
--failover-only     Don't leak work to backup pools when primary pool is lagging
--fix-protocol      Do not redirect to stratum protocol from GBT
--gekko-2pac-detect Detect GekkoScience 2Pac BM1384
--gekko-2pac-freq <arg> Set GekkoScience 2Pac BM1384 frequency in MHz, range 6.25-500 (default 100.0)
--gekko-bauddiv     Set GekkoScience BM1387 baud divider {0: auto, 1: 1.5M, 7: 375K, 13: 214K, 25: 115K}
--gekko-compac-detect Detect GekkoScience Compac BM1384
--gekko-compac-freq <arg> Set GekkoScience Compac BM1384 frequency in MHz, range 6.25-500 (default 150.0)
--gekko-compacf-detect Detect GekkoScience CompacF BM1397
--gekko-compacf-freq <arg> Set GekkoScience CompacF BM1397 frequency in MHz, range 100-800 (default 200.0)
--gekko-r909-detect Detect GekkoScience Terminus R909 BM1397
--gekko-r909-freq <arg> Set GekkoScience Terminus R909 BM1397 frequency in MHz, range 100-800 (default 450.0)
--gekko-lowboost    GekkoScience NewPac/R606 AsicBoost - 2 midstate
--gekko-newpac-detect Detect GekkoScience NewPac BM1387
--gekko-newpac-freq Set GekkoScience NewPac BM1387 frequency in MHz, range 50-900
--gekko-noboost     Disable GekkoScience NewPac/R606/CompacF/R909 AsicBoost
--gekko-r606-detect Detect GekkoScience Terminus BM1387
--gekko-r606-freq   Set GekkoScience Terminus R606 frequency in MHz, range 50-900
--gekko-serial      Detect GekkoScience Device by Serial Number
--gekko-start-freq  Ramp start frequency MHz 25-500
--gekko-step-delay  Ramp step interval range 1-600
--gekko-terminus-detect Detect GekkoScience Terminus BM1384
--gekko-terminus-freq <arg> Set GekkoScience Terminus BM1384 frequency in MHz, range 6.25-500 (default 150.0)
--gekko-tune-down   Set GekkoScience miner minimum hash quality, range 0-100
--gekko-tune-up     Set GekkoScience miner ramping hash threshold, range 0-99
--gekko-wait-factor Set GekkoScience miner task send wait factor, range 0.01-2.00
--hfa-hash-clock <arg> Set hashfast clock speed (default: 550)
--hfa-fail-drop <arg> Set how many MHz to drop clockspeed each failure on an overlocked hashfast device (default: 10)
--hfa-fan <arg>     Set fanspeed percentage for hashfast, single value or range (default: 10-85)
--hfa-name <arg>    Set a unique name for a single hashfast device specified with --usb or the first device found
--hfa-noshed        Disable hashfast dynamic core disabling feature
--hfa-options <arg> Set hashfast options name:clock (comma separated)
--hfa-temp-overheat <arg> Set the hashfast overheat throttling temperature (default: 95)
--hfa-temp-target <arg> Set the hashfast target temperature (0 to disable) (default: 88)
--hro-freq          Set the hashratio clock frequency (default: 280)
--hotplug <arg>     Seconds between hotplug checks (0 means never check)
--klondike-options <arg> Set klondike options clock:temptarget
--load-balance      Change multipool strategy from failover to quota based balance
--log|-l <arg>      Interval in seconds between log output (default: 5)
--lowmem            Minimise caching of shares for low memory applications
--mac-yield         Allow yield on old macs (default dont)
--minion-chipreport <arg> Seconds to report chip 5min hashrate, range 0-100 (default: 0=disabled)
--minion-freq <arg> Set minion chip frequencies in MHz, single value or comma list, range 100-1400 (default: 1200)
--minion-freqchange Millisecond total time to do frequency changes (default: 1000)
--minion-freqpercent Percentage to use when starting up a chip (default: 70%)
--minion-idlecount  Report when IdleCount is >0 or changes
--minion-ledcount   Turn off led when more than this many chips below the ledlimit (default: 0)
--minion-ledlimit   Turn off led when chips GHs are below this (default: 90)
--minion-noautofreq Disable automatic frequency adjustment
--minion-overheat   Enable directly halting any chip when the status exceeds 100C
--minion-spidelay   Add a delay in microseconds after each SPI I/O
--minion-spireset   SPI regular reset: iNNN for I/O count or sNNN for seconds - 0 means none
--minion-spisleep   Sleep time in milliseconds when doing an SPI reset
--minion-temp <arg> Set minion chip temperature threshold, single value or comma list, range 120-160 (default: 135C)
--monitor|-m <arg>  Use custom pipe cmd for output messages
--nfu-bits <arg>    Set nanofury bits for overclocking, range 32-63 (default: 50)
--net-delay         Impose small delays in networking to not overload slow routers
--no-submit-stale   Don't submit shares if they are detected as stale
--osm-led-mode <arg> Set LED mode for OneStringMiner devices (default: 4)
--pass|-p <arg>     Password for bitcoin JSON-RPC server
--per-device-stats  Force verbose mode and output per-device statistics
--protocol-dump|-P  Verbose dump of protocol-level activities
--queue|-Q <arg>    Minimum number of work items to have queued (0+) (default: 1)
--quiet|-q          Disable logging output, display status and errors
--quota|-U <arg>    quota;URL combination for server with load-balance strategy quotas
--real-quiet        Disable all output
--rock-freq <arg>   Set RockMiner frequency in MHz, range 200-400 (default: 270)
--rotate <arg>      Change multipool strategy from failover to regularly rotate at N minutes (default: 0)
--round-robin       Change multipool strategy from failover to round robin on failure
--scan-time|-s <arg> Upper bound on time spent scanning current work, in seconds (default: -1)
--sched-start <arg> Set a time of day in HH:MM to start mining (a once off without a stop time)
--sched-stop <arg>  Set a time of day in HH:MM to stop mining (will quit without a start time)
--sharelog <arg>    Append share log to file
--shares <arg>      Quit after mining N shares (default: unlimited)
--socks-proxy <arg> Set socks4 proxy (host:port)
--suggest-diff <arg> Suggest miner difficulty for pool to user (default: none)
--syslog            Use system log for output messages (default: standard error)
--temp-cutoff <arg> Temperature where a device will be automatically disabled, one value or comma separated list (default: 95)
--text-only|-T      Disable ncurses formatted screen output
--url|-o <arg>      URL for bitcoin JSON-RPC server
--usb <arg>         USB device selection
--user|-u <arg>     Username for bitcoin JSON-RPC server
--userpass|-O <arg> Username:Password pair for bitcoin JSON-RPC server
--verbose           Log verbose output to stderr as well as status output
--widescreen        Use extra wide display without toggling
--worktime          Display extra work time debug information
Options for command line only:
--config|-c <arg>   Load a JSON-format configuration file
See example.conf for an example configuration.
--default-config <arg> Specify the filename of the default config file
Loaded at start and used when saving without a name.
--help|-h           Print this message
--ndevs|-n          Display all USB devices and exit
--version|-V        Display version and exit


Silent USB device (ASIC and FPGA) options:

--icarus-options <arg> Set specific FPGA board configurations - one set of values for all or comma separated
--icarus-timing <arg> Set how the Icarus timing is calculated - one setting/value for all or comma separated
--usb-dump          (See FPGA-README)

See FGPA-README or ASIC-README for more information regarding these.


ASIC only options:

--anu-freq <arg>    Set AntminerU1/2 frequency in MHz, range 125-500 (default: 250.0)
--au3-freq <arg>    Set AntminerU3 frequency in MHz, range 100-250 (default: 225.0)
--au3-volt <arg>    Set AntminerU3 voltage in mv, range 725-850, 0 to not set (default: 750)
--avalon-auto       Adjust avalon overclock frequency dynamically for best hashrate
--avalon-cutoff <arg> Set avalon overheat cut off temperature (default: 60)
--avalon-fan <arg> Set fanspeed percentage for avalon, single value or range (default: 20-100)
--avalon-freq <arg> Set frequency range for avalon-auto, single value or range
--avalon-options <arg> Set avalon options baud:miners:asic:timeout:freq:tech
--avalon-temp <arg> Set avalon target temperature (default: 50)
--avalon2-freq      Set frequency range for Avalon2, single value or range
--avalon2-voltage   Set Avalon2 core voltage, in millivolts
--avalon2-fan       Set Avalon2 target fan speed
--avalon2-cutoff <arg> Set Avalon2 overheat cut off temperature (default: 88)
--avalon2-fixed-speed Set Avalon2 fan to fixed speed
--avalon4-automatic-voltage Automatic adjust voltage base on module DH
--avalon4-voltage   Set Avalon4 core voltage, in millivolts, step: 125
--avalon4-freq      Set frequency for Avalon4, 1 to 3 values, example: 445:385:370
--avalon4-fan       Set Avalon4 target fan speed range
--avalon4-temp <arg> Set Avalon4 target temperature (default: 42)
--avalon4-cutoff <arg> Set Avalon4 overheat cut off temperature (default: 65)
--avalon4-polling-delay <arg> Set Avalon4 polling delay value (ms) (default: 20)
--avalon4-ntime-offset <arg> Set Avalon4 MM ntime rolling max offset (default: 4)
--avalon4-aucspeed <arg> Set Avalon4 AUC IIC bus speed (default: 400000)
--avalon4-aucxdelay <arg> Set Avalon4 AUC IIC xfer read delay, 4800 ~= 1ms (default: 9600)
--avalon7-voltage   Set Avalon7 default core voltage, in millivolts, step: 78
--avalon7-voltage-level Set Avalon7 default level of core voltage, range:[0, 15], step: 1
--avalon7-voltage-offset Set Avalon7 default offset of core voltage, range:[-2, 1], step: 1
--avalon7-freq      Set Avalon7 default frequency, range:[24, 1404], step: 12, example: 500
--avalon7-freq-sel <arg> Set Avalon7 default frequency select, range:[0, 5], step: 1, example: 3 (default: 0)
--avalon7-fan       Set Avalon7 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalon7-temp <arg> Set Avalon7 target temperature, range:[0, 100] (default: 99)
--avalon7-polling-delay <arg> Set Avalon7 polling delay value (ms) (default: 20)
--avalon7-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalon7-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 19200)
--avalon7-smart-speed <arg> Set Avalon7 smart speed, range 0-1. 0 means Disable (default: 1)
--avalon7-th-pass <arg> Set A3212 th pass value (default: 162)
--avalon7-th-fail <arg> Set A3212 th fail value (default: 10921)
--avalon7-th-init <arg> Set A3212 th init value (default: 32767)
--avalon7-th-ms <arg> Set A3212 th ms value (default: 1)
--avalon7-th-timeout <arg> Set A3212 th timeout value (default: 0)
--avalon7-iic-detect Enable Avalon7 detect through iic controller
--avalon7-freqadj-time <arg> Set Avalon7 check interval when run in AVA7_FREQ_TEMPADJ_MODE (default: 60)
--avalon7-delta-temp <arg> Set Avalon7 delta temperature when reset freq in AVA7_FREQ_TEMPADJ_MODE (default: 0)
--avalon7-delta-freq <arg> Set Avalon7 delta freq when adjust freq in AVA7_FREQ_TEMPADJ_MODE (default: 100)
--avalon7-freqadj-temp <arg> Set Avalon7 check temperature when run into AVA7_FREQ_TEMPADJ_MODE (default: 104)
--avalon7-nonce-mask <arg> Set A3212 nonce mask, range 24-32. (default: 31)
--no-avalon7-asic-debug Disable A3212 debug.
--avalon8-voltage-level Set Avalon8 default level of core voltage, range:[0, 15], step: 1
--avalon8-voltage-level-offset Set Avalon8 default offset of core voltage level, range:[-2, 1], step: 1
--avalon8-freq      Set Avalon8 default frequency, range:[25, 1200], step: 25, example: 800
--avalon8-freq-sel <arg> Set Avalon8 default frequency select, range:[0, 3], step: 1, example: 3 (default: 3)
--avalon8-fan       Set Avalon8 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalon8-temp <arg> Set Avalon8 target temperature, range:[0, 100] (default: 90)
--avalon8-polling-delay <arg> Set Avalon8 polling delay value (ms) (default: 20)
--avalon8-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalon8-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 19200)
--avalon8-smart-speed <arg> Set Avalon8 smart speed, range 0-1. 0 means Disable (default: 1)
--avalon8-th-pass <arg> Set A3210 th pass value (default: -1)
--avalon8-th-fail <arg> Set A3210 th fail value (default: -1)
--avalon8-th-init <arg> Set A3210 th init value (default: 32767)
--avalon8-th-ms <arg> Set A3210 th ms value (default: 5)
--avalon8-th-timeout <arg> Set A3210 th timeout value (default: 4294967295)
--avalon8-th-add <arg> Set A3210 th add value (default: 1)
--avalon8-iic-detect Enable Avalon8 detect through iic controller
--avalon8-nonce-mask <arg> Set A3210 nonce mask, range 24-32. (default: -1)
--avalon8-nonce-check <arg> Set A3210 nonce check, range 0-1. (default: 1)
--avalon8-roll-enable <arg> Set A3210 roll enable, range 0-1. (default: 1)
--avalon8-mux-l2h <arg> Set Avalon8 mux l2h, range 0-2. (default: 0)
--avalon8-mux-h2l <arg> Set Avalon8 mux h2l, range 0-1. (default: 1)
--avalon8-h2ltime0-spd <arg> Set Avalon8 h2ltime0 spd, range 0-255. (default: 3)
--avalon8-spdlow <arg> Set Avalon8 spdlow, range 0-3. (default: -1)
--avalon8-spdhigh <arg> Set Avalon8 spdhigh, range 0-3. (default: 3)
--avalon8-cinfo-asic Set Avalon8 cinfo asic index, range:[0, 25], step: 1
--avalon8-pid-p <arg> Set Avalon8 pid-p, range 0-9999. (default: 2)
--avalon8-pid-i <arg> Set Avalon8 pid-i, range 0-9999. (default: 5)
--avalon8-pid-d <arg> Set Avalon8 pid-d, range 0-9999. (default: 0)
--avalon9-voltage-level Set Avalon9 default level of core voltage, range:[0, 15], step: 1
--avalon9-voltage-level-offset Set Avalon9 default offset of core voltage level, range:[-2, 1], step: 1
--avalon9-freq      Set Avalon9 default frequency, range:[25, 1200], step: 25, example: 800
--avalon9-freq-sel <arg> Set Avalon9 default frequency select, range:[0, 7], step: 1, example: 7 (default: 7)
--avalon9-fan       Set Avalon9 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalon9-temp <arg> Set Avalon9 target temperature, range:[0, 100] (default: 93)
--avalon9-polling-delay <arg> Set Avalon9 polling delay value (ms) (default: 20)
--avalon9-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalon9-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 24000)
--avalon9-smart-speed <arg> Set Avalon9 smart speed, range 0-1. 0 means Disable (default: 1)
--avalon9-th-pass <arg> Set A3206 th pass value (default: 8)
--avalon9-th-fail <arg> Set A3206 th fail value (default: 1000)
--avalon9-th-init <arg> Set A3206 th init value (default: 32767)
--avalon9-th-ms <arg> Set A3206 th ms value (default: 2)
--avalon9-th-timeout <arg> Set A3206 th timeout value (default: 1550000)
--avalon9-th-add <arg> Set A3206 th add value (default: 0)
--avalon9-th-mssel <arg> Set A3206 th mssel value (default: 0)
--avalon9-lv2-th-add <arg> Set A3206 lv2 th add value (default: 0)
--avalon9-lv2-th-ms <arg> Set A3206 lv2 th ms value (default: 0)
--avalon9-lv3-th-add <arg> Set A3206 lv3 th add value (default: 0)
--avalon9-lv3-th-ms <arg> Set A3206 lv3 th ms value (default: 0)
--avalon9-lv4-th-add <arg> Set A3206 lv4 th add value (default: 0)
--avalon9-lv4-th-ms <arg> Set A3206 lv4 th ms value (default: 0)
--avalon9-lv5-th-add <arg> Set A3206 lv5 th add value (default: 0)
--avalon9-lv5-th-ms <arg> Set A3206 lv5 th ms value (default: 0)
--avalon9-lv6-th-add <arg> Set A3206 lv6 th add value (default: 0)
--avalon9-lv6-th-ms <arg> Set A3206 lv6 th ms value (default: 0)
--avalon9-lv7-th-add <arg> Set A3206 lv7 th add value (default: 0)
--avalon9-lv7-th-ms <arg> Set A3206 lv7 th ms value (default: 0)
--avalon9-iic-detect Enable Avalon9 detect through iic controller
--avalon9-nonce-mask <arg> Set A3206 nonce mask, range 24-32. (default: 24)
--avalon9-nonce-check <arg> Set A3206 nonce check, range 0-1. (default: 1)
--avalon9-roll-enable <arg> Set A3206 roll enable, range 0-1. (default: 1)
--avalon9-mux-l2h <arg> Set Avalon9 mux l2h, range 0-2. (default: 0)
--avalon9-mux-h2l <arg> Set Avalon9 mux h2l, range 0-1. (default: 1)
--avalon9-h2ltime0-spd <arg> Set Avalon9 h2ltime0 spd, range 0-255. (default: 3)
--avalon9-spdlow <arg> Set Avalon9 spdlow, range 0-7. (default: 0)
--avalon9-spdhigh <arg> Set Avalon9 spdhigh, range 0-7. (default: 7)
--avalon9-tbase <arg> Set Avalon9 tbase and use (0-8) bits, range 0-255. (default: 0)
--avalon9-pid-p <arg> Set Avalon9 pid-p, range 0-9999. (default: 1)
--avalon9-pid-i <arg> Set Avalon9 pid-i, range 0-9999. (default: 5)
--avalon9-pid-d <arg> Set Avalon9 pid-d, range 0-9999. (default: 0)
--avalon9-adjust-volt-info Set Avalon9 adjust volt info, range 0-9999
--avalonlc3-voltage-level Set Avalonlc3 default level of core voltage, range:[0, 31], step: 1
--avalonlc3-voltage-level-offset Set Avalonlc3 default offset of core voltage level, range:[-2, 1], step: 1
--avalonlc3-freq    Set Avalonlc3 default frequency, range:[25, 1200], step: 25, example: 800
--avalonlc3-freq-sel <arg> Set Avalonlc3 default frequency select, range:[0, 4], step: 1, example: 3 (default: 3)
--avalonlc3-fan     Set Avalonlc3 target fan speed, range:[0, 100], step: 1, example: 0-100
--avalonlc3-temp <arg> Set Avalonlc3 target temperature, range:[0, 100] (default: 90)
--avalonlc3-polling-delay <arg> Set Avalonlc3 polling delay value (ms) (default: 20)
--avalonlc3-aucspeed <arg> Set AUC3 IIC bus speed (default: 400000)
--avalonlc3-aucxdelay <arg> Set AUC3 IIC xfer read delay, 4800 ~= 1ms (default: 19200)
--avalonlc3-smart-speed <arg> Set Avalonlc3 smart speed, range 0-1. 0 means Disable (default: 1)
--avalonlc3-th-pass <arg> Set A3210M th pass value (default: 200)
--avalonlc3-th-fail <arg> Set A3210M th fail value (default: 7000)
--avalonlc3-th-init <arg> Set A3210M th init value (default: 32767)
--avalonlc3-th-ms <arg> Set A3210M th ms value (default: 5)
--avalonlc3-th-timeout <arg> Set A3210M th timeout value (default: 16000)
--avalonlc3-th-add <arg> Set A3210M th add value (default: 1)
--avalonlc3-iic-detect Enable Avalonlc3 detect through iic controller
--avalonlc3-nonce-mask <arg> Set A3210M nonce mask, range 24-32. (default: 27)
--avalonlc3-nonce-check <arg> Set A3210M nonce check, range 0-1. (default: 1)
--avalonlc3-roll-enable <arg> Set A3210M roll enable, range 0-1. (default: 1)
--avalonlc3-mux-l2h <arg> Set Avalonlc3 mux l2h, range 0-2. (default: 0)
--avalonlc3-mux-h2l <arg> Set Avalonlc3 mux h2l, range 0-1. (default: 1)
--avalonlc3-h2ltime0-spd <arg> Set Avalonlc3 h2ltime0 spd, range 0-255. (default: 3)
--avalonlc3-spdlow <arg> Set Avalonlc3 spdlow, range 0-3. (default: 2)
--avalonlc3-spdhigh <arg> Set Avalonlc3 spdhigh, range 0-3. (default: 3)
--avalonlc3-tbase <arg> Set Avalonlc3 tbase and use (0-8) bits, range 0-255. (default: 0)
--avalonlc3-cinfo-asic Set Avalonlc3 cinfo asic index, range:[0, 25], step: 1
--avalonlc3-pid-p <arg> Set Avalonlc3 pid-p, range 0-9999. (default: 2)
--avalonlc3-pid-i <arg> Set Avalonlc3 pid-i, range 0-9999. (default: 5)
--avalonlc3-pid-d <arg> Set Avalonlc3 pid-d, range 0-9999. (default: 0)
--bab-options <arg> Set BaB options max:def:min:up:down:hz:delay:trf
--bflsc-overheat <arg> Set overheat temperature where BFLSC devices throttle, 0 to disable (default: 90)
--bitburner-fury-options <arg> Override avalon-options for BitBurner Fury boards baud:miners:asic:timeout:freq
--bitburner-fury-voltage <arg> Set BitBurner Fury core voltage, in millivolts
--bitburner-voltage <arg> Set BitBurner (Avalon) core voltage, in millivolts
--bitmine-a1-options <ref_clk>:<sys_clk>:<spi_clk>:<max_chip>
--bxf-temp-target <arg> Set target temperature for BXF devices (default: 82)
--bxm-bits <arg>    Set BXM bits for overclocking (default: 50)
--compac-freq <arg> Set GekkoScience Compac frequency in MHz, range 100-500 (default: 150.0)
--dragonmint-t1-options <arg> Dragonmint T1 options ref_clk_khz:sys_clk_khz:spi_clk_khz:override_chip_num
--T1efficient       Tune Dragonmint T1 per chain voltage and frequency for optimal efficiency
--T1noauto          Disable Dragonmint T1 per chain auto voltage and frequency tuning
--T1performance     Tune Dragonmint T1 per chain voltage and frequency for maximum performance
--T1fantarget <arg> Throttle T1 frequency to keep fan less than target fan speed (default: 100)
--T1Pll1 <arg>      Set PLL Clock 1 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll2 <arg>      Set PLL Clock 2 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll3 <arg>      Set PLL Clock 3 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll4 <arg>      Set PLL Clock 4 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll5 <arg>      Set PLL Clock 5 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll6 <arg>      Set PLL Clock 6 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll7 <arg>      Set PLL Clock 7 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Pll8 <arg>      Set PLL Clock 8 in Dragonmint T1 broad 1 chip (-1: 1000MHz, >0:Lookup PLL table) (default: 1332)
--T1Volt1 <arg>     Dragonmint T1 set voltage 1 - VID overrides if set (390-425) (default: 404)
--T1Volt2 <arg>     Dragonmint T1 set voltage 2 - VID overrides if set (390-425) (default: 404)
--T1Volt3 <arg>     Dragonmint T1 set voltage 3 - VID overrides if set (390-425) (default: 404)
--T1Volt4 <arg>     Dragonmint T1 set voltage 4 - VID overrides if set (390-425) (default: 404)
--T1Volt5 <arg>     Dragonmint T1 set voltage 5 - VID overrides if set (390-425) (default: 404)
--T1Volt6 <arg>     Dragonmint T1 set voltage 6 - VID overrides if set (390-425) (default: 404)
--T1Volt7 <arg>     Dragonmint T1 set voltage 7 - VID overrides if set (390-425) (default: 404)
--T1Volt8 <arg>     Dragonmint T1 set voltage 8 - VID overrides if set (390-425) (default: 404)
--T1VID1 <arg>      Dragonmint T1 set VID 1 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID2 <arg>      Dragonmint T1 set VID 2 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID3 <arg>      Dragonmint T1 set VID 3 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID4 <arg>      Dragonmint T1 set VID 4 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID5 <arg>      Dragonmint T1 set VID 5 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID6 <arg>      Dragonmint T1 set VID 6 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID7 <arg>      Dragonmint T1 set VID 7 in noauto - Overrides voltage if set (1-31) (default: 0)
--T1VID8 <arg>      Dragonmint T1 set VID 8 in noauto - Overrides voltage if set (1-31) (default: 0)
--hfa-hash-clock <arg> Set hashfast clock speed (default: 550)
--hfa-fail-drop <arg> Set how many MHz to drop clockspeed each failure on an overlocked hashfast device (default: 10)
--hfa-fan <arg>     Set fanspeed percentage for hashfast, single value or range (default: 10-85)
--hfa-name <arg>    Set a unique name for a single hashfast device specified with --usb or the first device found
--hfa-noshed        Disable hashfast dynamic core disabling feature
--hfa-temp-overheat <arg> Set the hashfast overheat throttling temperature (default: 95)
--hfa-temp-target <arg> Set the hashfast target temperature (0 to disable) (default: 88)
--hro-freq          Set the hashratio clock frequency (default: 280)
--klondike-options <arg> Set klondike options clock:temptarget
--rock-freq <arg>   Set RockMiner frequency in MHz, range 125-500 (default: 270)

See ASIC-README for more information regarding these.


FPGA only options:

--bfl-range         Use nonce range on bitforce devices if supported

See FGPA-README for more information regarding this.


Cgminer should automatically find all of your Avalon ASIC, BFL ASIC, BitForce
FPGAs, Icarus bitstream FPGAs, Klondike ASIC, ASICMINER usb block erupters,
KnC ASICs, BaB ASICs, Hashfast ASICs, ModMiner FPGAs, BPMC/BGMC BF1 USB ASICs,
Bi*fury USB ASICs, Onestring miner USB ASICs, Hexfury USB ASICs, Nanofury USB
ASICs, Antminer U1/U2/U2+ U3 USB ASICs, Cointerra devices, BFx2 USB ASICs,
Rockminer R-Box/RK-Box/T1 USB ASICs, Avalon2/3/4 USB ASICs and Hashratio USB
ASICs.

---

SETTING UP USB DEVICES on WINDOWS/LINUX/OSX

WINDOWS:

On windows, the direct USB support requires the installation of a WinUSB
driver (NOT the ftdi_sio driver), and attaching it to the chosen USB device.

When configuring your device, plug it in and wait for windows to attempt to
install a driver on its own. It may think it has succeeded or failed but wait
for it to finish regardless.

If the driver doesn't allow mining, cgminer will get a "USB init," error message
i.e. one of:
 open device failed, err %d, you need to install a WinUSB driver for the device
or
 claim interface %d failed, err %d

This means you need to associate your device with the WinUSB driver.

The best solution for this is to use a tool called Zadig to set the driver:
 https://sourceforge.net/projects/libwdi/files/zadig/
They've moved the latest versions to:
  https://zadig.akeo.ie/

This allows you set the driver for the device to be WinUSB which is
required to make it work if you're having problems.
With Zadig, you will need to run it as administrator and if your device is
plugged in but you cannot see it, use the Menu: Options -> List All Devices
and you should be able to see the device in the drop down list as something
like: "CompacF Bitcoin Miner"
Choose the install or replace driver option and select WinUSB.

When you first switch a device over to WinUSB with Zadig and it shows that
correctly on the left of the Zadig window, but it still gives permission
errors, you may need to unplug the USB miner and then plug it back in. Some
users may need to reboot at this point.


LINUX:

The short version:

 sudo cp 01-cgminer.rules /etc/udev/rules.d/


The long version:

On linux, the direct USB support requires no drivers at all. However due to
permissions issues, you may not be able to mine directly on the devices as a
regular user without giving the user access to the device or by mining as
root (administrator). In order to give your regular user access, you can make
him a member of the plugdev group with the following commands:

 sudo usermod -G plugdev -a `whoami`

If your distribution does not have the plugdev group you can create it with:

 sudo groupadd plugdev

In order for the USB devices to instantly be owned by the plugdev group and
accessible by anyone from the plugdev group you can copy the file
"01-cgminer.rules" from the cgminer archive into the /etc/udev/rules.d
directory with the following command:

 sudo cp 01-cgminer.rules /etc/udev/rules.d/

After this you can either manually restart udev and re-login, or more easily
just reboot.


OSX:

On OSX, like Linux, no drivers need to be installed. However some devices
like the bitfury USB sticks automatically load a driver thinking they're a
modem and the driver needs to be unloaded for cgminer to work:

 sudo kextunload -b com.apple.driver.AppleUSBCDC
 sudo kextunload -b com.apple.driver.AppleUSBCDCACMData

If you are running an old Mac and desktop performance is noticeably affected,
adding the --mac-yield option may help, but also may slow down mining.

There may be a limit to the number of USB devices that you are allowed to start.
The following set of commands, followed by a reboot will increase that:

 sudo su
 touch /etc/sysctl.conf
 echo kern.sysv.semume=100 >> /etc/sysctl.conf
 chown root:wheel /etc/sysctl.conf
 chmod 0644 /etc/sysctl.conf

Some devices need superuser access to mine on them so cgminer may need to
be started with sudo
i.e.:
 sudo cgminer <insert commands here>


There is a hidden option in cgminer to dump out a lot of information
about USB that will help the developers to assist you if you are having
problems:

 --usb-dump 0

It will only help if you have a working USB mining device

---

Advanced USB options:

The --usb option can restrict how many USB devices are found:

  --usb 1:2,1:3,1:4,1:*
or
  --usb BAS:1,BFL:1,MMQ:0,ICA:0,KLN:0
or
  --usb :10

You can only use one of the above 3

The first version
  --usb 1:2,1:3,1:4,1:*
allows you to select which devices to mine on with a list of USB
 bus_number:device_address
All other USB devices will be ignored
Hotplug will also only look at the devices matching the list specified and
find nothing new if they are all in use
You can specify just the USB bus_number to find all devices like 1:*
which means any devices on USB bus_number 1
This is useful if you unplug a device then plug it back in the same port,
it usually reappears with the same bus_number but a different device_address

You can see the list of all USB devices on linux with 'sudo lsusb'
Cgminer will list the recognised USB devices

with the '-n' option or the
'--usb-dump 0' option
The '--usb-dump N' option with a value of N greater than 0 will dump a lot
of details about each recognised USB device
If you wish to see all USB devices, include the --usb-list-all option

The second version
  --usb BAS:1,BFL:1,MMQ:0,ICA:0,KLN:0
allows you to specify how many devices to choose based on each device
driver cgminer has - the current USB drivers are:
AVA, BAS, BFL, BF1, DRB, HFA, ICA, KLN and MMQ.

N.B. you can only specify which device driver to limit, not the type of
each device, e.g. with BAS:n you can limit how many BFL ASIC devices will
be checked, but you cannot limit the number of each type of BFL ASIC

Also note that the MMQ count is the number of MMQ backplanes you have
not the number of MMQ FPGAs

The third version
  --usb :10
means only use a maximum of 10 devices of any supported USB devices
Once cgminer has 10 devices it will not configure any more and hotplug will
not scan for any more
If one of the 10 devices stops working, hotplug - if enabled, as is default
- will scan normally again until it has 10 devices

  --usb :0 will disable all USB I/O other than to initialise libusb

---

SCREEN DISPLAY WHILE RUNNING:

The following options are available while running with a single keypress:

 [U]SB management [P]ool management [S]ettings [D]isplay options [Q]uit


U gives you:

[S]ummary of device information
[E]nable device
[D]isable device
[U]nplug to allow hotplug restart
[R]eset device USB
[L]ist all known devices
[B]lacklist current device from current instance of cgminer
[W]hitelist previously blacklisted device
[H]otplug interval (0 to disable)


P gives you:

Current pool management strategy: Failover
[F]ailover only disabled
[A]dd pool [R]emove pool [D]isable pool [E]nable pool
[C]hange management strategy [S]witch pool [I]nformation


S gives you:

[Q]ueue: 1
[S]cantime: 60
[E]xpiry: 120
[W]rite config file
[C]gminer restart


D gives you:

[N]ormal [C]lear [S]ilent mode (disable all output)
[D]ebug:off
[P]er-device:off
[Q]uiet:off
[V]erbose:off
[R]PC debug:off
[W]orkTime details:off
co[M]pact: off
[T]oggle status switching:enabled
[Z]ero statistics
[L]og interval:5


Q quits the application.


The running log shows output like this:

 [2013-11-09 11:04:41] Accepted 01b3bde7 Diff 150/128 AVA 1 pool 0
 [2013-11-09 11:04:49] Accepted 015df995 Diff 187/128 AVA 1 pool 0
 [2013-11-09 11:04:50] Accepted 01163b68 Diff 236/128 AVA 1 pool 0
 [2013-11-09 11:04:53] Accepted 9f745840 Diff 411/128 BAS 1 pool 0

The 8 byte hex value are the 1st nonzero bytes of the share being submitted to
the pool. The 2 diff values are the actual difficulty target that share reached
followed by the difficulty target the pool is currently asking for.

---

Also many issues and FAQs are covered in the forum thread
dedicated to this program,
	http://forum.bitcoin.org/index.php?topic=28402.0

DISPLAY:

The display is roughly split into two portions, the top status window and the
bottom scrolling log window.


STATUS WINDOW
The status window is split into overall status and per device status.

Overall status:

The output line shows the following:
 (5s):1.398T (1m):1.322T (5m):1.305T (15m):1.309T (avg):1.317Th/s

These are exponentially decaying average hashrates over 5s/1m/5m/15m and an
average since the start.

Followed by:
 A:290391  R:5101  HW:145  WU:37610.4/m

Each column is as follows:
A:  The total difficulty of Accepted shares
R:  The total difficulty of Rejected shares
HW:  The number of HardWare errors
WU:  The Work Utility defined as the number of diff1 shares work / minute
     (accepted or rejected).

alternating with:
 ST: 22  SS: 0  NB: 2  LW: 356090  GF: 0  RF: 0

ST is STaged work items (ready to use).
SS is Stale Shares discarded (detected and not submitted so don't count as rejects)
NB is New Blocks detected on the network
LW is Locally generated Work items
GF is Getwork Fail Occasions (server slow to provide work)
RF is Remote Fail occasions (server slow to accept work)

Followed by:
 Connected to stratum.kano.is diff 3.45K with stratum as user Kano

The diff shown is the current vardiff requested by the pool currently being
mined at.

Followed by:
Block: b1a8c743...  Diff:19T  Started: [00:14:27.666]  Best share: 1.18M

This shows a short stretch about the current block, when the new block started,
and the all time best difficulty share you've found since starting cgminer
this time.

Per device status:

 0: GSF 100nnnnn: 400.00MHz  85C  13% 0.79V  | 263.5G / 263.7Gh/s WU:18901.8/m

Each column is as follows:
Temperature (if supported)
Fanspeed (if supported)
Voltage (if supported)

A 5 second exponentially decaying average hash rate
An all time average hash rate
The work utility defined as the number of diff1 shares work / minute

alternating with

 0: GSF 100nnnnn: 400.00MHz  86C  13% 0.80V  | A:290348 R:1067 HW:88

The total difficulty of accepted shares
The total difficulty of rejected shares
The number of hardware erorrs


LOG WINDOW

All running information is shown here, usually share submission results and
block update notifications, along with device messages and warnings.

 [2021-09-27 11:59:04.397] Accepted 1397768d Diff 3.35K/727 GSF 0 pool 0
 [2021-09-27 12:59:05.397] Stratum from pool 0 detected new block at height 702417

---

MULTIPLE POOL CONNECTIONS

FAILOVER STRATEGIES WITH MULTIPOOL:
A number of different strategies for dealing with multipool setups are
available. Each has their advantages and disadvantages so multiple strategies
are available by user choice, as per the following list:

FAILOVER:
The default strategy is failover. This means that if you input a number of
pools, it will try to use them as a priority list, moving away from the 1st
to the 2nd, 2nd to 3rd and so on. If any of the earlier pools recover, it will
move back to the higher priority ones.

ROUND ROBIN:
This strategy only moves from one pool to the next when the current one falls
idle and makes no attempt to move otherwise.

ROTATE:
This strategy moves at user-defined intervals from one active pool to the next,
skipping pools that are idle.

LOAD BALANCE:
This strategy sends work to all the pools on a quota basis. By default, all
pools are allocated equal quotas unless specified with --quota. This
apportioning of work is based on work handed out, not shares returned so is
independent of difficulty targets or rejected shares. While a pool is disabled
or dead, its quota is dropped until it is re-enabled. Quotas are forward
looking, so if the quota is changed on the fly, it only affects future work.
If all pools are set to zero quota or all pools with quota are dead, it will
fall back to a failover mode. See quota below for more information.

The failover-only flag has special meaning in combination with load-balance
mode and it will distribute quota back to priority pool 0 from any pools that
are unable to provide work for any reason so as to maintain quota ratios
between the rest of the pools.

BALANCE:
This strategy monitors the amount of difficulty 1 shares solved for each pool
and uses it to try to end up doing the same amount of work for all pools.


---

QUOTAS

The load-balance multipool strategy works off a quota based scheduler. The
quotas handed out by default are equal, but the user is allowed to specify any
arbitrary ratio of quotas. For example, if all the quota values add up to 100,
each quota value will be a percentage, but if 2 pools are specified and pool0
is given a quota of 1 and pool1 is given a quota of 9, pool0 will get 10% of
the work and pool1 will get 90%. Quotas can be changed on the fly by the API,
and do not act retrospectively. Setting a quota to zero will effectively
disable that pool unless all other pools are disabled or dead. In that
scenario, load-balance falls back to regular failover priority-based strategy.
While a pool is dead, it loses its quota and no attempt is made to catch up
when it comes back to life.

To specify quotas on the command line, pools should be specified with a
semicolon separated --quota(or -U) entry instead of --url. Pools specified with
--url are given a nominal quota value of 1 and entries can be mixed.

For example:
--url poola:porta -u usernamea -p passa --quota "2;poolb:portb" -u usernameb -p passb
Will give poola 1/3 of the work and poolb 2/3 of the work.

Writing configuration files with quotas is likewise supported. To use the above
quotas in a configuration file they would be specified thus:

"pools" : [
        {
                "url" : "poola:porta",
                "user" : "usernamea",
                "pass" : "passa"
        },
        {
                "quota" : "2;poolb:portb",
                "user" : "usernameb",
                "pass" : "passb"
        }
]


---

SOLO MINING

Solo mining doesn't currently work

---

LOGGING

cgminer will log to stderr if it detects stderr is being redirected to a file.
To enable logging simply add 2>logfile.txt to your command line and logfile.txt
will contain the logged output at the log level you specify (normal, verbose,
debug etc.)

In other words if you would normally use:
./cgminer -o xxx -u yyy -p zzz
if you use
./cgminer -o xxx -u yyy -p zzz 2>logfile.txt
it will log to a file called logfile.txt and otherwise work the same.

There is also the -m option on linux which will spawn a command of your choice
and pipe the output directly to that command.

The WorkTime details 'debug' option adds details on the end of each line
displayed for Accepted or Rejected work done. An example would be:

 <-00000059.ed4834a3 M:X D:1.0 G:17:02:38:0.405 C:1.855 (2.995) W:3.440 (0.000) S:0.461 R:17:02:47

The first 2 hex codes are the previous block hash, the rest are reported in
seconds unless stated otherwise:
The previous hash is followed by the getwork mode used M:X where X is one of
P:Pool, T:Test Pool, L:LP or B:Benchmark,
then D:d.ddd is the difficulty required to get a share from the work,
then G:hh:mm:ss:n.nnn, which is when the getwork or LP was sent to the pool and
the n.nnn is how long it took to reply,
followed by 'O' on it's own if it is an original getwork, or 'C:n.nnn' if it was
a clone with n.nnn stating how long after the work was recieved that it was cloned,
(m.mmm) is how long from when the original work was received until work started,
W:n.nnn is how long the work took to process until it was ready to submit,
(m.mmm) is how long from ready to submit to actually doing the submit, this is
usually 0.000 unless there was a problem with submitting the work,
S:n.nnn is how long it took to submit the completed work and await the reply,
R:hh:mm:ss is the actual time the work submit reply was received

If you start cgminer with the --sharelog option, you can get detailed
information for each share found. The argument to the option may be "-" for
standard output (not advisable with the ncurses UI), any valid positive number
for that file descriptor, or a filename.

To log share data to a file named "share.log", you can use either:
./cgminer --sharelog 50 -o xxx -u yyy -p zzz 50>share.log
./cgminer --sharelog share.log -o xxx -u yyy -p zzz

For every share found, data will be logged in a CSV (Comma Separated Value)
format:
    timestamp,disposition,target,pool,dev,thr,sharehash,sharedata
For example (this is wrapped, but it's all on one line for real):
    1335313090,reject,
    ffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000,
    http://localhost:8337,ASC0,0,
    6f983c918f3299b58febf95ec4d0c7094ed634bc13754553ec34fc3800000000,
    00000001a0980aff4ce4a96d53f4b89a2d5f0e765c978640fe24372a000001c5
    000000004a4366808f81d44f26df3d69d7dc4b3473385930462d9ab707b50498
    f681634a4f1f63d01a0cd43fb338000000000080000000000000000000000000
    0000000000000000000000000000000000000000000000000000000080020000

---

BENCHMARK

The --benchmark option hashes a single fixed work item over and over and does
not submit shares to any pools.

The --benchfile <arg> option hashes the work given in the file <arg> supplied.
The format of the work file is:
version,merkleroot,prevhash,diffbits,noncetime
Any empty line or any line starting with '#' or '/' is ignored.
When it reaches the end of the file it continues back at the top.

The format of the data items matches the byte ordering and format of the
the bitcoind getblock RPC output.

An example file containing bitcoin block #1 would be:

# Block 1
1,0e3e2357e806b6cdb1f70b54c3a3a17b6714ee1f0e68bebb44a74b1efd512098,00000000001
9d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f,1d00ffff,1231469665

However, the work data should be one line without the linebreak in the middle

If you use --benchfile <arg>, then --benchfile-display will output a log line,
for each nonce found, showing the nonce value in decimal and hex and the work
used to find it in hex.

---

RPC API

For RPC API details see the API-README file

---

FAQ

Q: Help, I've started cgminer and everything reads zero!?
A: Welcome to bitcoin mining. Your computer by itself cannot mine bitcoin no
matter how powerful it is. You have to purchase dedicated mining hardware
called ASICs to plug into your computer. See Q regarding ASICs below.

Q: I have multiple USB stick devices but I can't get them all to work at once?
A: Very few USB hubs deliver the promised power required to run as many devices
as they fit if all of them draw power from USB.

Q: I've plugged my devices into my USB hub but nothing shows up?
A: RPis and Windows have incomplete or non-standard USB3 support so they may
never work. It may be possible to get a USB3 hub to work by plugging it into
a USB2 hub. When choosing a hub, USB2 hubs are preferable whenever possible
due to better support all round.

Q: Can I mine on servers from different networks (eg xxxcoin and bitcoin) at
the same time?
A: No, cgminer keeps a database of the block it's working on to ensure it does
not work on stale blocks, and having different blocks from two networks would
make it invalidate the work from each other.

Q: Can I configure cgminer to mine with different login credentials or pools
for each separate device?
A: No.

Q: Can I put multiple pools in the config file?
A: Yes, check the example.conf file. Alternatively, set up everything either on
the command line or via the menu after startup and choose settings->write
config file and the file will be loaded one each startup.

Q: The build fails with gcc is unable to build a binary.
A: Remove the "-march=native" component of your CFLAGS as your version of gcc
does not support it. Also -O2 is capital o 2, not zero 2.

Q: Work keeps going to my backup pool even though my primary pool hasn't
failed?
A: Cgminer checks for conditions where the primary pool is lagging and will
pass some work to the backup servers under those conditions. The reason for
doing this is to try its absolute best to keep the devices working on something
useful and not risk idle periods. You can disable this behaviour with the
option --failover-only.

Q: Is this a virus?
A: Cgminer is being packaged with other trojan scripts and some antivirus
software is falsely accusing cgminer.exe as being the actual virus, rather
than whatever it is being packaged with. If you installed cgminer yourself,
then you do not have a virus on your computer. Complain to your antivirus
software company. They seem to be flagging even source code now from cgminer
as viruses, even though text source files can't do anything by themself.

Q: Can you modify the display to include more of one thing in the output and
less of another, or can you change the quiet mode or can you add yet another
output mode?
A: Everyone will always have their own view of what's important to monitor.
The defaults are very sane and I have very little interest in changing this
any further. There is far more detail in the API output than can be reasonably
displayed on the small console window, and using an external interface such
as miner.php is much more useful for setups with many devices.

Q: What are the best parameters to pass for X pool/hardware/device.
A: Virtually always, the DEFAULT parameters give the best results. Most user
defined settings lead to worse performance.

Q: What happened to CPU and GPU mining?
A: Their efficiency makes them irrelevant in the bitcoin mining world today
and the author has no interest in supporting alternative coins that are better
mined by these devices.

Q: GUI version?
A: No. The RPC interface makes it possible for someone else to write one
though, and miner.php can create web page access to the RPC API

Q: I'm having an issue. What debugging information should I provide?
A: Start cgminer with your regular commands and add -D -T --verbose and provide
the full startup output and a summary of your hardware and operating system.

Q: Why don't you provide win64 builds?
A: Win32 builds work everywhere.

Q: Is it faster to mine on windows or linux?
A: It makes no difference in terms of performance. It comes down to choice of
operating system for their various features and your comfort level. However
linux is the primary development platform and is virtually guaranteed to be
more stable.

Q: My network gets slower and slower and then dies for a minute?
A; Try the --net-delay option if you are on a GBT server. This does nothing
with stratum mining.

Q: I run PHP on windows to access the API with the example miner.php. Why does
it fail when php is installed properly but I only get errors about Sockets not
working in the logs?
A: http://us.php.net/manual/en/sockets.installation.php

Q: What is an ASIC?
A: They are Application Specify Integrated Circuit devices and provide the
highest performance per unit power due to being dedicated to only one purpose.
They are the only meaningful way to mine bitcoin today.

Q: What is stratum and how do I use it?
A: Stratum is a protocol designed for pooled mining in such a way as to
minimise the amount of network communications, yet scale to hardware of any
speed. With versions of cgminer 2.8.0+, if a pool has stratum support, cgminer
will automatically detect it and switch to the support as advertised if it can.
The advantages of stratum to the miner are no
delays in getting more work for the miner, less rejects across block changes,
and far less network communications for the same amount of mining hashrate. If
you do NOT wish cgminer to automatically switch to stratum protocol even if it
is detected, add the --fix-protocol option.

Q: Why don't the statistics add up: Accepted, Rejected, Stale, Hardware Errors,
Diff1 Work, etc. when mining greater than 1 difficulty shares?
A: As an example, if you look at 'Difficulty Accepted' in the RPC API, the number
of difficulty shares accepted does not usually exactly equal the amount of work
done to find them. If you are mining at 8 difficulty, then you would expect on
average to find one 8 difficulty share, per 8 single difficulty shares found.
However, the number is actually random and converges over time, it is an average,
not an exact value, thus you may find more or less than the expected average.

Q: My keyboard input momentarily pauses or repeats keys every so often on
windows while mining?
A: The USB implementation on windows can be very flaky on some hardware and
every time cgminer looks for new hardware to hotplug it it can cause these
sorts of problems. You can disable hotplug with:
--hotplug 0

Q: What is a PGA?
A: Cgminer supports 3 FPGAs: BitForce, Icarus and ModMiner.
They are Field-Programmable Gate Arrays that have been programmed to do Bitcoin
mining. Since the acronym needs to be only 3 characters, the "Field-" part has
been skipped.

Q: What should my Work Utility (WU) be?
A: Work utility is the product of hashrate * luck and only stabilises over a
very long period of time. Assuming all your work is valid work, bitcoin mining
should produce a work utility of approximately 1 per 71.6MH. This means at
5GH you should have a WU of 5000 / 71.6 or ~ 69. You cannot make your machine
do "better WU" than this - it is luck related. However you can make it much
worse if your machine produces a lot of hardware errors producing invalid work.

Q: What should I build in for a generic distribution binary?
A: There are a number of drivers that expect to be used on dedicated standalone
hardware. That said, the drivers that are designed to work generically with
USB on any hardware are the following:

--enable-avalon
--enable-avalon2
--enable-avalon4
--enable-avalon7
--enable-avalon8
--enable-bflsc
--enable-bitfury
--enable-cointerra
--enable-drillbit
--enable-gekko
--enable-hashfast
--enable-hashratio
--enable-icarus
--enable-klondike

Q: How do I use the --decode function to decode a pool's coinbase?
A: You need to have a bitcoind with server functionality and pass it the
credentials as the first pool in your config, and pass the pool's address that
you wish to decode as the second pool configured. Note the bitcoind NEEDS the
http:// prefix.

e.g.:
./cgminer -o http://localhost:8332 -u user -p pass -o stratum.kano.is:3333 -u cgminer --decode


---

This code is provided entirely free of charge by the programmers.

If you wish to support it, simply mine at https://kano.is/

