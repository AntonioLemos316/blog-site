import mysql from 'mysql2/promise';
import mysqlConfig from './dbConfig.js';

class Database {
  constructor(config) {
    this.config = config;
    this.connection = null;
  }

  async connect() {
    try {
      this.connection = await mysql.createConnection(this.config);
      console.log('Conexão com o MySQL efetuada com sucesso!');
    } catch (error) {
      console.error(`Erro ao conectar com o MySQL: ${error.stack}`);
      throw error;
    }
  }

  async query(sql, params = []) {
    if (!this.connection) {
      throw new Error('Conexão com o banco de dados não está estabelecida.');
    }
    try {
      const [rows, fields] = await this.connection.execute(sql, params);
      return { rows, fields };
    } catch (error) {
      console.error(`Erro ao executar consulta: ${error.stack}`);
      throw error;
    }
  }
}

const db = new Database(mysqlConfig);

export default db;
