/*Código e comentários posteriores a esse foram realizados em uma faixa de tempo que varia entre os dias 18/11 e 24 do mesmo mês.*/
/* criar o database */
CREATE DATABASE loja_virtual;
USE loja_virtual;
/* criando as tabelinhas para usar depois, sem segredo por aqui ainda*/
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil ENUM('cliente','admin') DEFAULT 'cliente',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    imagem VARCHAR(255),
    ativo BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (categoria_id)
    REFERENCES categorias(id)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    forma_pagamento ENUM('PIX','BOLETO','CARTAO'),
    total DECIMAL(10,2) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE pedido_itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY(pedido_id)
    REFERENCES pedidos(id),

    FOREIGN KEY(produto_id)
    REFERENCES produtos(id)
);
/* Começando a colocar os dados, nada de errado até então*/
INSERT INTO categorias(nome)
VALUES
('Notebooks'),
('Monitores'),
('Teclados');

/* 20/11: Essa parte do código eu passei papo de uns 20 minutos tentando entender e descobrir porque estava dando errado quando eu tentava abrir pelo xampp, então pedi ajuda do copilot e não tenho certeza exata do que ele fez, mas funcionou.*/

INSERT INTO produtos
(categoria_id,nome,descricao,preco,estoque,imagem)
VALUES
(
1,
'Notebook Dell',
'Notebook para estudos',
3500.00,
10,
'dell.jpg'
),
(
2,
'Monitor LG',
'Monitor Full HD',
899.90,
20,
'lg.jpg'
),
(
3,
'Teclado Mecânico',
'Switch Blue',
250.00,
15,
'teclado.jpg'
);

INSERT INTO usuarios
(nome,email,senha,perfil)
VALUES
(
'Administrador',
'admin@admin.com',
'$2y$10$WZXWw5CEiBzKBslZx2drF.bI8I4JVXu2fLG3gNsYch0eYRqpMfrQa',
'admin'
);