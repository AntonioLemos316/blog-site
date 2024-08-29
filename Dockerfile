# Imagem oficial a ser utilizada
FROM mysql:8.0

# Indicando o caminho e a copia a ser feita
COPY ./database/db.sql /docker-entrypoint.initdb.d/

# Porta que será exposta/utilizada
EXPOSE 3306

# Senha que será utilizada
ENV MYSQL_ROOT_PASSWORD='123'


