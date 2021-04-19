#!/bin/bash

>tcplog.txt

socat TCP4-LISTEN:20002,reuseaddr,fork - | while read message ; do
	# A4'e gelen mesajları dinleliniyor.
	echo "TCP-->[${message}] {`date`}" >> tcplog.txt # Gelen mesaj verileri dosyaya yazıldı.
done