# Imagem oficial a ser utilizada
FROM mysql:8.0

# Copiar o arquivo SQL para o diretório de inicialização do MySQL
COPY /database/db.sql /docker-entrypoint-initdb.d/

# Porta que será exposta/utilizada
EXPOSE 3306

# Senha que será utilizada
ENV MYSQL_ROOT_PASSWORD=root

# Baixando a imagem oficial 
#	sudo docker pull mysql:8.0 
#	// baixa o mysql e especifica a versão

# Construir uma nova imagem baseado em nosso Dockerfile
#	sudo docker build -t img-nome-mysql .
# 	// nomeia e monta a imagem de acordo com o Dockerfile

# Construir um contêiner e associar a nova imagem criada
#	sudo docker run --name cont-nome -p 3306:3306 -d img-nome-mysql 
#	// cria um container, descreve seu nome, a porta que será 
#	// escutado e roda a imagem criada anteriormente