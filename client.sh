#!/bin/bash

>client.txt

tcp_send(){
	for (( i = 1; i <= 10; i++ ));
	do
		message="{id:”171213080”,no:”${i}”,msg:”TCP packet from client”, timestamp:”`date`”}"
		echo $message | socat - TCP4:localhost:5001
		echo "CLIENT-->TCP:{$message}{$i}{`date`}" >>client.txt #Mesaj verileri dosyaya yazıldı.
	done
	#A2'ye TCP4 mesajları yollanıldı.
}
udp_send(){
	for (( i = 1; i <= 10; i++ ));
	do
		message="{id:”171213080”,no:”${i}”,msg:”UDP packet from client”, timestamp:”`date`”}"
		echo $message | socat - UDP4:localhost:5001
		echo "CLIENT-->UDP:{$message}{$i}{`date`}" >>client.txt #Mesaj verileri dosyaya yazıldı.
	done
	#A2'ye UDP4 mesajları yollandı.
}

tcp_send
udp_send