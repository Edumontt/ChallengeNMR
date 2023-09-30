# ChallengeNMR

Nosso programa(FAB) é um antiransomware que detecta arquivos isca no sistema, ele tem como objetivo capturar alterações nos arquivos e matar o ransomware.

Manual de instalação - FAB

#### IMPORTATE: REALIZE A INSTALAÇÃO DO PROGRAMA COMO SUPERUSUÁRIO ROOT !!! ####

0- Pré Requisitos:
    
0.1 Sistema Operacional: GNU/Linux;
    
0.2 Lista de dependencias (serão instalados junto do programa ao executar o instalador):

-  inotify

-  auditctl

-  git

-  tar

-  gzip

-  gcc


1- Download

1.1 Baixe o instalador.sh no seu Sistema Operacional. (Você pode instalar diretamente do site ou executar "git clone" no seu terminal);


1.2 Para executar o "git clone" é necessário instalar o "git" no seu sistema, você pode fazer isso pelo comando: "sudo apt-get install git";


1.3 Após instalar o git execute o comando: "git clone https://github.com/Edumontt/ChallengeNMR.git"


2- Permissões

2.1 Altere para a conta de superusuário 'root';

2.2 Altere as permissões do instalador para que ele possa ser executado(certifique-se que o terminal está na mesma pasta do instalador);

2.3 Comando a ser executado no terminal: "chmod a+x instalador.sh"

3- Instalação

3.1 Execute o instalador, siga os passos indicados e aguarde a mensagem de instalação concluída;

Comando a ser executado no terminal: "./instalador.sh"

4- Execução

4.1 Reinicie o computador. O programa e o serviço de backup serão executados automaticamente com o sistema.

#### IMPORTATE: O PROGRAMA CRIA OS ARQUIVOS HONEYFILES DE ACORDO COM A ESCOLHA DO USUÁRIO !!! ####

----------------------------------------------------------------------------------------------------------------------------------------------------

Esse git vem com um programa em python chamado "virus.py"(Esse programa não é um vírus malicioso) para verificar se o programa está realmente em execução;

Esse "virus.py" executa alterações em um arquivo isca dentro do diretório /home;

IMPORTATE: CASO VOCÊ ESTEJA USANDO O LINUX SEM INTERFACE GRÁFICA É NECESSÁRIO INSTALAR O PYTHON NO SISTEMA. Comando: sudo apt-get install python3

Execute o virus.py em um terminal através do comando: "python3 virus.py"

Caso o terminal retorne como "killed" ou "terminated" o programa (FAB) etá executando corretamente.

CZe9gZ6x03b0HvfpHdYtKZ93tG2az6y99/PPNcAZOTnbfo+mdlvtyeSwCXftlFeL4M5tq0avRcgRKg2a2Nf7BCDHggH8s3i92oUnVCD51A2P/l/Bje1ywVyZJVworz9aUBaIk5agSI6TTSX/hzuP97EwLcid0zyEQRVMbtrfz8fPo6pTMY0h4JKyesWsGOE5
