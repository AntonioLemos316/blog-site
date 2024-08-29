-- Cria o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS blog_site;
USE blog_site;

-- Cria a tabela Users se não existir
CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Cria a tabela News se não existir
CREATE TABLE IF NOT EXISTS News (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Cria a tabela Courses se não existir
CREATE TABLE IF NOT EXISTS Courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    duration INT,  -- Duração em horas
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Cria a tabela Comments se não existir
CREATE TABLE IF NOT EXISTS Comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT,
    news_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (course_id) REFERENCES Courses(id),
    FOREIGN KEY (news_id) REFERENCES News(id)
);

-- Cria a tabela Favorites se não existir
CREATE TABLE IF NOT EXISTS Favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT,
    news_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (course_id) REFERENCES Courses(id),
    FOREIGN KEY (news_id) REFERENCES News(id),
    UNIQUE (user_id, course_id, news_id)  -- Garante que o mesmo item não possa ser adicionado duas vezes pelo mesmo usuário
);

-- Inserir exemplos de dados na tabela Users
INSERT INTO Users (username, email, password_hash) VALUES
('user1', 'user1@example.com', 'hashed_password1'),
('user2', 'user2@example.com', 'hashed_password2'),
('user3', 'user3@example.com', 'hashed_password3');

-- Inserir exemplos de dados na tabela News
INSERT INTO News (title, content, published_at) VALUES
('Notícia 1', 'Conteúdo da Notícia 1', '2024-08-01 10:00:00'),
('Notícia 2', 'Conteúdo da Notícia 2', '2024-08-02 11:00:00'),
('Notícia 3', 'Conteúdo da Notícia 3', '2024-08-03 12:00:00');

-- Inserir exemplos de dados na tabela Courses
INSERT INTO Courses (title, description, price, duration) VALUES
('Curso 1', 'Descrição do Curso 1', 100.00, 10),
('Curso 2', 'Descrição do Curso 2', 150.00, 20),
('Curso 3', 'Descrição do Curso 3', 200.00, 30);

-- Inserir exemplos de dados na tabela Comments
INSERT INTO Comments (user_id, course_id, news_id, content) VALUES
(1, NULL, 1, 'Comentário sobre a Notícia 1'),
(2, 2, NULL, 'Comentário sobre o Curso 2'),
(3, NULL, 3, 'Comentário sobre a Notícia 3');

-- Inserir exemplos de dados na tabela Favorites
INSERT INTO Favorites (user_id, course_id, news_id) VALUES
(1, NULL, 1),
(2, 2, NULL),
(3, NULL, 3);
