#!/bin/bash

#export http_proxy="http://157.92.49.223:8080"

case "$1" in
	#Web Server
	web)
	echo "Web Server"	
	apt-get install apache2
	echo ""
	echo ""

	ps -ef | grep "apache2" | grep -v "grep" > /dev/null
	if [ "$?" -eq "0" ]
	then
		echo "Servidor Web apache 2 está corriendo."
	else
		echo "Servidor Web apache 2 NO está corriendo."
		echo "Iniciando servidor Web.."
		/etc/init.d/apache2 start
	fi
	;;
	
	#Telnet Server
	tel)
	echo "Telnet Server"
	apt-get install telnetd	
	echo ""
	echo ""
	
	ps -ef | grep "inetd" | grep -v "grep" > /dev/null
	if [ "$?" -eq "0" ]
	then
		echo "Servidor Telnet está corriendo."
	else
		echo "Servidor Telnet NO está corriendo."
		echo "Iniciando servidor Telnet.."
		/etc/init.d/openbsd-inetd start
		# /etc/init.d/inetd start
	fi
	;;
	
	#FTP Server
	ftp)
	echo "FTP Server"
	apt-get install vsftpd
	echo ""
	echo ""

	ps -ef | grep "vsftpd" | grep -v "grep" > /dev/null
	if [ "$?" -eq "0" ]
	then
		echo "Servidor Ftp está corriendo."
	else
		echo "Servidor Ftp NO está corriendo."
		echo "Iniciando servidor Ftp.."
		/etc/init.d/vsftpd start
	fi
	;;

	# Configuración de /etc/vsftpd.conf
	# local_enable=YES para autorizar usuarios locales.
	# write_enable=YES para autorizar que los usuario suban archivos.
	# chroot_local_user=YES para restringir el acceso al home de los usuarios.
	# Desde el cliente, con una vez logueado, con los comandos get y put se pueden transferir archivos.

	*)
	echo "Las opciones válidas son: web, tel o ftp."
	;;
esac
