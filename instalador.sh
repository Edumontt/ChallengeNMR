#!/bin/bash

read -p "\n Para instalar o programa é necessário instalar alguns recursos, pode ser que demore um pouco\n Deseja instalar? : (S)im ou (N)ao:  " escolha

if [ $escolha = "s" ] || [ $escolha = "S" ]; then
	apt-get update -y
	apt-get upgrade -y
	apt-get install auditd -y
	apt-get install git -y
	apt install tar gzip build-essential -y
	apt-get install gcc -y
	apt-get install inotify-tools -y
else
	echo "Para continuar é preciso instalar."
	exit
fi
sleep 2
echo -e "\n---------------------------------------------------------"

echo -e "\n\nCriando pastas do programa"
echo "......."
sleep 1
echo -e "\nCriando pasta de backup"
echo -e "mkdir -p /bkp/backup"
mkdir -p /bkp/backup
sleep 1
echo -e "\nCriando pasta do programa"
echo -e "mkdir /.FAB"
echo -e "touch /.FAB/logs"
echo -e "touch codigo.txt"
mkdir /.FAB
touch /.FAB/logs
touch codigo.txt
sleep 1
echo -e "\nCriando regras do programa"
echo -e "touch audit.sh"
touch audit.sh
echo "#!/bin/bash" > audit.sh
sleep 1

echo -e "Pastas criadas"
echo -e "\n---------------------------------------------------------"

sleep 2

usuarios=$(logname)

for i in $usuarios; do

	if [ -d "/home/$i/Área de Trabalho" ]; then
		desktop="Área de Trabalho"
	else
		desktop="Desktop"
	fi

	if [ -d "/home/$i/Vídeos" ]; then
		videos="Vídeos"
	else
		videos="Videos"
	fi
	if [ -d "/home/$i/Documentos" ]; then 
		documents="Documentos"
	else
		documents="Documents"
	fi
	if [ -d "/home/$i/Imagens" ]; then
		pictures="Imagens"
	else
		pictures="Pictures"
	fi
	if [ -d "/home/$i/Música" ]; then
		music="Música"
	else
		music="Music"
	fi
		if [ -d "/home/$i/Público" ]; then
		public="Público"
	else
		public="Public"
	fi
			if [ -d "/home/$i/Modelos" ]; then
		templates="Modelos"
	else
		templates="Templates"
	fi
done

echo -e "\n\nCriando arquivos HoneyFiles"
arquivos="n1m1.txt"
sleep 1
echo -e "\n\nDescompactando"
unzip template.zip
for i in $usuarios; do
	cp template.txt /home/$arquivos 2>/dev/null
    echo -e "movendo arquivo para /home"
	cp template.txt /home/$i/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i"
	cp template.txt /home/$i/$desktop/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$desktop/"
	cp template.txt /home/$i/Downloads/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/Downloads"
	cp template.txt /home/$i/$documents/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$documents"
	cp template.txt /home/$i/$pictures/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$pictures"
	cp template.txt /home/$i/snap/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/snap"
	cp template.txt /home/$i/$videos/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$videos"
	cp template.txt /home/$i/$music/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$music"
	cp template.txt /home/$i/$public/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$public"
	cp template.txt /home/$i/$templates/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /home/$i/$templates"
	cp template.txt /boot/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /boot"
	cp template.txt /etc/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /etc"
	cp template.txt /root/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /root"
	cp template.txt /usr/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /usr"
	cp template.txt /var/$arquivos 2>/dev/null
	echo -e "movendo arquivo para /var"
done
echo -e "HoneyFiles concluídos"
sleep 2

echo -e "\n---------------------------------------------------------"

echo -e "\n\nDando permissão aos arquivos HoneyFiles"
echo "...."
sleep 1
echo "........"
sleep 1
echo "............"
for i in $usuarios; do
	chmod 777 /home/$arquivos
	chmod 777 /home/$i/$arquivos
	chmod 777 /home/$i/$desktop/$arquivos  
	chmod 777 /home/$i/Downloads/$arquivos 
	chmod 777 /home/$i/$documents/$arquivos 
	chmod 777 /home/$i/$pictures/$arquivos 
	chmod 777 /home/$i/snap/$arquivos  
	chmod 777 /home/$i/$videos/$arquivos 
	chmod 777 /home/$i/$music/$arquivos  
	chmod 777 /home/$i/$public/$arquivos 
	chmod 777 /home/$i/$templates/$arquivos 
	chmod 777 /boot/$arquivos 
	chmod 777 /etc/$arquivos 
	chmod 777 /root/$arquivos 
	chmod 777 /usr/$arquivos 
	chmod 777 /var/$arquivos 
done
echo -e "Permissão concluída"
sleep 2

echo -e "\n---------------------------------------------------------"

echo -e "\n\nAdicionando regras ao sistema"
echo "...."
sleep 1
echo "........"
sleep 1
echo "............"
for i in $usuarios; do	
	sudo auditctl -w /home/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$desktop/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$desktop/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/Downloads/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/Downloads/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$documents/$arquivos-p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$documents/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$pictures/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$pictures/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/snap/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo sudo auditctl -w /home/$i/snap/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$videos/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$videos/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$music/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$music/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$public/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$public/$arquivos -p wa -k fab_changes" >> audit.sh
	sudo auditctl -w /home/$i/$templates/$arquivos -p wa -k fab_changes 2>/dev/null
	echo "sudo auditctl -w /home/$i/$templates/$arquivos -p wa -k fab_changes" >> audit.sh
done
sudo auditctl -w /boot/$arquivos -p wa -k fab_changes
echo "sudo auditctl -w /boot/$arquivos -p wa -k fab_changes" >> audit.sh
sudo auditctl -w /etc/$arquivos -p wa -k fab_changes
echo "sudo auditctl -w /etc/$arquivos -p wa -k fab_changes" >> audit.sh
sudo auditctl -w /root/$arquivos -p wa -k fab_changes
echo "sudo auditctl -w /root/$arquivos -p wa -k fab_changes" >> audit.sh
sudo auditctl -w /usr/$arquivos -p wa -k fab_changes
echo "sudo auditctl -w /usr/$arquivos -p wa -k fab_changes" >> audit.sh
sudo auditctl -w /var/$arquivos -p wa -k fab_changes
echo "sudo auditctl -w /var/$arquivos -p wa -k fab_changes" >> audit.sh

echo -e "\n\nRegras concluídas"
sleep 2

echo -e "\n---------------------------------------------------------"

echo -e "\n\nAdicionando programa ao sistema"
echo "...."
sleep 1
echo "........"
sleep 1
echo "............"
for i in $usuarios; do 

	echo "#include <stdio.h>" >> ./codigo.txt
	echo "#include <stdlib.h>" >> ./codigo.txt
	echo "#include <unistd.h>" >> ./codigo.txt
	echo "#include <sys/inotify.h>" >> ./codigo.txt

	echo "#define EVENT_SIZE (sizeof(struct inotify_event))" >> ./codigo.txt
	echo "#define EVENT_BUF_LEN (1024 * (EVENT_SIZE + 16))" >> ./codigo.txt

	echo "int main() {" >> ./codigo.txt

	echo "    system(\"/.FAB/audit.sh\");" >> ./codigo.txt

	echo "    int fd;" >> ./codigo.txt
	echo "    int wd[16];" >> ./codigo.txt
	echo "    char buffer[EVENT_BUF_LEN];" >> ./codigo.txt
	echo "    fd = inotify_init();" >> ./codigo.txt
	echo "    if (fd < 0) {" >> ./codigo.txt
	echo "        perror(\"inotify_init\");" >> ./codigo.txt
	echo "        return -1;" >> ./codigo.txt
	echo "    }" >> ./codigo.txt

	echo "    char *caminhos[] = {" >> ./codigo.txt
	echo "        \"/home/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$desktop/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/Downloads/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$documents/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$pictures/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/snap/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$videos/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$music/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$public/$arquivos\"," >> ./codigo.txt
	echo "        \"/home/$i/$templates/$arquivos\"," >> ./codigo.txt
	echo "        \"/boot/$arquivos\"," >> ./codigo.txt
	echo "        \"/etc/$arquivos\"," >> ./codigo.txt
	echo "        \"/root/$arquivos\"," >> ./codigo.txt
	echo "        \"/usr/$arquivos\"," >> ./codigo.txt
	echo "        \"/var/$arquivos\"" >> ./codigo.txt
	echo "    };" >> ./codigo.txt

	echo "    for (int i = 0; i < 16; i++) {" >> ./codigo.txt
	echo "        wd[i] = inotify_add_watch(fd, caminhos[i], IN_MODIFY);" >> ./codigo.txt
	echo "        if (wd[i] == -1) {" >> ./codigo.txt
	echo "            perror(\"inotify_add_watch\");" >> ./codigo.txt
	echo "            return -1;" >> ./codigo.txt
	echo "        }" >> ./codigo.txt
	echo "    }" >> ./codigo.txt

	echo "    printf(\"Aguardando alterações nos arquivos...\n\");" >> ./codigo.txt
	echo "    while (1) {" >> ./codigo.txt
	echo "    int length = read(fd, buffer, EVENT_BUF_LEN);" >> ./codigo.txt

	echo "    if (length < 0) {" >> ./codigo.txt
	echo "        (\"read\");" >> ./codigo.txt
	echo "        return -1;" >> ./codigo.txt
	echo "    }" >> ./codigo.txt

	echo "    int i = 0;" >> ./codigo.txt
	echo "    while (i < length) {" >> ./codigo.txt
	echo "        struct inotify_event *event = (struct inotify_event *)&buffer[i];" >> ./codigo.txt
	echo "        if (event->mask & IN_MODIFY) {" >> ./codigo.txt
	echo "            for (int j = 0; j < 16; j++) {" >> ./codigo.txt
	echo "                if (event->wd == wd[j]) {" >> ./codigo.txt
	echo "                    printf(\"Alteração detectada em %s. Executando pid...\n\", caminhos[j]);" >> ./codigo.txt
	echo "                    system(\"/.FAB/pid\");" >> ./codigo.txt
	echo "                    printf(\"Execução do pid concluída.\n\");" >> ./codigo.txt
	echo "                }" >> ./codigo.txt
	echo "            }" >> ./codigo.txt
	echo "        }" >> ./codigo.txt

	echo "        i += EVENT_SIZE + event->len;" >> ./codigo.txt
	echo "    }" >> ./codigo.txt
	echo "}" >> ./codigo.txt

	echo "    for (int i = 0; i < 16; i++) {" >> ./codigo.txt
	echo "        inotify_rm_watch(fd, wd[i]);" >> ./codigo.txt
	echo "    }" >> ./codigo.txt
	echo "    close(fd);" >> ./codigo.txt


	echo "    return 0;" >> ./codigo.txt
	echo "}" >> ./codigo.txt

done
echo -e "\nConcluído"
echo -e "\n---------------------------------------------------------"
sleep 2


echo -e "\nCompilando arquivos"
mv codigo.txt codigo.c
gcc codigo.c -o FAB
echo -e "Arquivos compilados"

echo -e "\n---------------------------------------------------------"

sleep 2

echo -e "\n\nMovendo arquivos importantes"

mv codigo.txt codigo.c
echo -e "\n movendo serviço de backup para system"
mv backup.service /etc/systemd/system
echo -e "\n movendo serviço de auditlg para system"
mv auditlg.service /etc/systemd/system
echo -e "\n movendo serviço FAB para system"
mv FAB.service /etc/systemd/system
echo -e "\n movendo arquivos do programa para pasta /.FAB"
mv pid /.FAB
mv FAB /.FAB
mv backup.sh /.FAB
mv audit.sh /.FAB

echo -e "Arquivos movidos"
sleep 1

echo -e "\n---------------------------------------------------------"

echo -e "\n\nDando permissão aos arquivos importantes"
echo "...."
sleep 2
echo "........"
chmod a+x /.FAB/FAB
chmod a+x /.FAB/pid
chmod a+x /.FAB/backup.sh
chmod a+x /.FAB/audit.sh
chmod 777 /.FAB/logs

echo -e "Permissão concluída"
sleep 1

echo -e "\n---------------------------------------------------------"

echo -e "\n\nHabilitando serviços do sistema"
sleep 1
echo -e "sudo systemctl daemon-reload"
sudo systemctl daemon-reload
echo -e "sudo systemctl enable auditlg.service"
sudo systemctl enable auditlg.service
echo -e "sudo systemctl enable backup.service"
sudo systemctl enable backup.service
echo -e "sudo systemctl enable FAB.service"
sudo systemctl enable FAB.service
sleep 1
sudo systemctl enable auditd.service
echo -e "sudo systemctl daemon-reload"
sudo systemctl daemon-reload


echo -e "Serviços iniciados"

echo -e "\n---------------------------------------------------------"


rm codigo.c
rm -rf fab
rm template.txt


echo -e "Instalação concluída"

read -p "\n\n Para que o programa funcione da maneira correta é recomendado reiniciar o sistema. Deseja reiniciar agora? (S)im ou (N)ao: " reiniciar

if [ $reiniciar  = "s" ] || [ $reiniciar  = "S" ]; then
reboot -f
 
else 
echo "Você optou por não reiniciar, o programa funcionará na próxima vez que reiniciar o sistema"
exit
fi
