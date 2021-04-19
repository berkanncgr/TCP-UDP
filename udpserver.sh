#!/bin/bash

>udplog.txt

socat UDP4-LISTEN:10001,reuseaddr,fork - | while read message ; do
	# A3'e gelen mesajlar dinleniliyor.
	echo "UDP-->[${message}] {`date`}" >> udplog.txt # Gelen mesaj verileri dosyaya yazıldı.
done