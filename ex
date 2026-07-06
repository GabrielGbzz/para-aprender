CREATE DATABASE bibliotech;
USE bibliotech;

CREATE TABLE Cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
email VARCHAR(50),
endereco VARCHAR(99),
telefone VARCHAR(15)
);

CREATE TABLE Categoria (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
descricao VARCHAR(100)
);

CREATE TABLE Autor (
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
nacionalidade VARCHAR(50),
data_nascimento DATE
);

CREATE TABLE Livro (
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100),
isbn VARCHAR(50),
ano_publicacao DATE,
tipo_emprestimo VARCHAR(1),

id_autor INT,
id_categoria INT,

FOREIGN KEY (id_autor)
REFERENCES Autor(id_autor),

FOREIGN KEY (id_categoria)
REFERENCES Categoria(id_categoria)
);

CREATE TABLE Exemplar (
id_exemplar INT AUTO_INCREMENT PRIMARY KEY,
codigo_exemplar VARCHAR(11),
estado_conservacao VARCHAR(30),
disponibilidade VARCHAR(20),

id_livro INT,

FOREIGN KEY (id_livro)
REFERENCES Livro(id_livro)
);

CREATE TABLE Emprestimo (
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
data_emprestimo DATE,
data_prevista_devolucao DATE,
data_devolucao DATE,
tipo VARCHAR(20),

id_cliente INT,
id_exemplar INT,

FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_exemplar)
REFERENCES Exemplar(id_exemplar)
);

CREATE TABLE Multa (
id_multa INT AUTO_INCREMENT PRIMARY KEY,
valor DECIMAL(10,2),
data_multa DATE,
status_pagamento VARCHAR(20),

id_emprestimo INT,

FOREIGN KEY (id_emprestimo)
REFERENCES Emprestimo(id_emprestimo)
);
