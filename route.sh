#!/bin/bash

>route.txt

tcp_route(){
	socat TCP4-LISTEN:5001,reuseaddr,fork - | 
	while read message ; # TCP4 measjları dinleniyor.
	do
	echo $message | socat - TCP4:localhost:20002 # TCP4 mesajları A4'e yönlendirildi.
	echo "ROUTER-->TCP:[${message} {`date`}]" >> route.txt # Mesaj verileri dosyaya yazıldı.
	done
	}
udp_route(){
	socat UDP4-LISTEN:5001,reuseaddr,fork - | 
	while read message ; # UDP4 mesajları dinleniyor.
	do
	echo $message | socat - UDP4:localhost:10001 # UDP4 mesajları A3'e yönlendirildi.
	echo "ROUTER-->UDP:[${message} {`date`}]" >> route.txt # Mesaj verileri dosyaya yazıldı.
	done
	}
	
tcp_route & udp_route