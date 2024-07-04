while true
do
./cgminer -o stratum+tcp://solo.ckpool.org:3333 -u bc1qws3z9dxdxtjq8vtj64042sxpvpjx3z9lza8ewk -p x --bitcoinminer-wait-factor 1 --bitcoinminer-btv1-freq 600 --bitcoinminer-usb-detect --bitcoinminer-start-freq 600 --suggest-diff 512
done

