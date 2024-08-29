import mysql from 'mysql2/promise';

class Database {
  // Construtor para injeção de dependências
  constructor(config) {
    // Criação do pool de conexões usando a configuração fornecida
    this.pool = mysql.createPool(config);
  }

  // Método para executar uma consulta
  async query(sql, values = []) {
    try {
      // Aguarda a resposta do pool e retorna os resultados
      const [rows, fields] = await this.pool.query(sql, values);
      return { rows, fields };
    } catch (error) {
      // Captura e exibe qualquer erro que ocorra durante a consulta
      console.error('Database query error:', error);
      throw error;
    }
  }
}

// Configuração do pool de conexões
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: '123',
  database: 'blog-site',
};

// Instância da classe Database com a configuração fornecida
const db = new Database(dbConfig);

export default db;
