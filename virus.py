import time

while True:
    try:
        # Abra o arquivo em modo de escrita (w) para adicionar uma linha de texto
        with open('/home/n1m1.txt', 'a') as file:
            file.write('Nova linha de texto\n')
        
        # Feche o arquivo
        file.close()
        
        # Espere 2 segundos antes da próxima iteração
        time.sleep(2)
    except Exception as e:
        print(f"Ocorreu um erro: {e}")