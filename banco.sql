CREATE DATABASE bdjoguinhos;

USE bdjoguinhos;

CREATE TABLE Usuarios(
Usuario VARCHAR(20) UNIQUE PRIMARY KEY,
Senha VARCHAR(64) NOT NULL,
Adm BOOl NOT NULL
);
