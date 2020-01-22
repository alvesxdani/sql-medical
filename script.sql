//Excluir o banco de dados
DROP DATABASE CLINICA;

//Exerc�cio1
CREATE DATABASE CLINICA;

//Modificando o banco de dados para uso
USE CLINICA;

//Apagando as tabelas
drop table ambulatorios;
drop table medicos;
drop table pacientes;
drop table funcionarios;
drop table consultas;

//Exerc�cio 2
CREATE TABLE Ambulatorios (
	nroa integer PRIMARY KEY,
	andar numeric(3) NOT NULL,
	capacidade smallint
);

CREATE TABLE Medicos (
	codm integer,
	nome varchar(40) NOT NULL,
	idade smallint NOT NULL,
	especialidade char(20), 
	CPF numeric(11) UNIQUE,
	cidade varchar(30),
	nroa integer,
	PRIMARY KEY(codm),
	--FOREIGN KEY(nroa) REFERENCES Ambulatorios (nroa)	
);

ALTER TABLE Medicos ADD constraint FK_Ambulatorios_Medicos
FOREIGN KEY(nroa) REFERENCES Ambulatorios (nroa);

CREATE TABLE Pacientes (
	codp integer PRIMARY KEY, 
	nome varchar(40) NOT NULL,
    idade smallint NOT NULL,
	cidade char(30),
    CPF numeric(11) UNIQUE,
    doenca varchar(40) NOT NULL
);

CREATE TABLE Funcionarios (
	codf integer PRIMARY KEY,
	nome varchar(40) NOT NULL,
	idade smallint,
	CPF numeric(11) UNIQUE,
	cidade varchar(30),
	salario numeric(10),
	cargo varchar(20)
);

CREATE TABLE Consultas(
	codm integer,
	codp integer,
	data date,
	hora time,
    PRIMARY KEY(codm, codp, data, hora),
	--FOREIGN KEY(codm) REFERENCES Medicos (codm),
    --FOREIGN KEY(codp) REFERENCES Pacientes (codp)
);

ALTER TABLE Consultas ADD constraint FK_Medicos_Consultas
FOREIGN KEY(codm) REFERENCES Medicos (codm);
ALTER TABLE Consultas ADD constraint FK_Pacientes_Consultas
FOREIGN KEY(codp) REFERENCES Pacientes (codp);

//Exer�cio 3
ALTER TABLE Funcionarios ADD nroa integer;
ALTER TABLE Funcionarios ADD constraint fk_nroa
FOREIGN KEY(nroa) REFERENCES Ambulatorios (nroa);

//Exercicio 4
DROP INDEX indMedico_CPF ON medicos;
DROP INDEX indPaciente_DOENCA ON Pacientes;
CREATE UNIQUE INDEX indMedico_CPF ON medicos (CPF);
CREATE INDEX indPaciente_DOENCA ON Pacientes (doenca);

//Exercicio 5
DROP INDEX indPaciente_DOENCA ON Pacientes;

//Exerc�cio 6
ALTER TABLE Funcionarios DROP FOREIGN KEY fk_nroa;
ALTER TABLE Funcionarios DROP COLUMN cargo;
ALTER TABLE Funcionarios DROP COLUMN nroa;

//Incluindo os Ambulatorios
INSERT INTO Ambulatorios VALUES (1, 1, 30);
INSERT INTO Ambulatorios VALUES (2, 1, 50);
INSERT INTO Ambulatorios VALUES (3, 2, 40);
INSERT INTO Ambulatorios VALUES (4, 2, 25);
INSERT INTO Ambulatorios VALUES (5, 2, 50);

//Incluindo os M�dicos
INSERT INTO Medicos VALUES (1, 'Joao', 40, 'ortopedia', 10000100000, 'Florianopolis', 1);
INSERT INTO Medicos VALUES (2, 'Maria', 42, 'traumatologia', 10000110000, 'Blumenau', 2);
INSERT INTO Medicos VALUES (3, 'Pedro', 51, 'pediatria', 11000100000, 'S�o Jos�', 2);
INSERT INTO Medicos VALUES (4, 'Carlos', 28, 'ortopedia', 11000110000, 'Joinville', null);
INSERT INTO Medicos VALUES (5, 'Marcia', 33, 'neurologia', 11000111000, 'Biguacu', 3);

//Incluindos os Pacientes
INSERT INTO Pacientes VALUES (1, 'Ana', 20, 'Florianopolis', 20000200000,'gripe');
INSERT INTO Pacientes VALUES (2, 'Paulo', 24, 'Palhoca', 20000220000,'fratura');
INSERT INTO Pacientes VALUES (3, 'Lucia', 30, 'Biguacu', 22000200000, 'tendinite');
INSERT INTO Pacientes VALUES (4, 'Carlos', 28, 'Joinville', 11000110000, 'sarampo');

//Ou dessa forma...
INSERT into pacientes (codp,nome,idade,cidade,CPF,doenca) VALUES (1, 'Ana', 20, 'Florianopolis', 20000200000, 'gripe');
INSERT into pacientes (codp,nome,idade,cidade,CPF,doenca) VALUES (2, 'Paulo', 24, 'Palhoca', 20000220000, 'fratura');
INSERT into pacientes (codp,nome,idade,cidade,CPF,doenca) VALUES (3, 'Lucia', 30, 'Biguacu', 22000200000, 'tendinite');
INSERT into pacientes (codp,nome,idade,cidade,CPF,doenca) VALUES (4, 'Carlos', 28, 'Joinville', 11000110000, 'sarampo');

//Voltar com o nora e cargo na tabela funcionarios
ALTER TABLE Funcionarios ADD nroa integer, cargo varchar(20);

//Inserindo os Funcionarios
INSERT INTO Funcionarios VALUES (1, 'Rita', 32, 20000100000, 'Sao Jose', 1200, 2, 'Secretaria');
INSERT INTO Funcionarios VALUES (2, 'Maria', 55, 30000110000, 'Palhoca', 1220, 4, 'Contadora');
INSERT INTO Funcionarios VALUES (3, 'Caio', 45, 41000100000, 'Florianopolis', 1100, 5, 'Analista de Sistemas');
INSERT INTO Funcionarios VALUES (4, 'Carlos', 44, 51000110000, 'Florianopolis', 1200, 3, 'Secretario');
INSERT INTO Funcionarios VALUES (5, 'Paula', 33, 61000111000, 'Florianopolis', 2500, 1, 'Telefonista');


//Inserindo as Consultas
INSERT INTO Consultas VALUES (1, 1, '2006/06/12', '14:00');
INSERT INTO Consultas VALUES (1, 4, '2006/06/13', '10:00');
INSERT INTO Consultas VALUES (2, 1, '2006/06/13', '09:00');
INSERT INTO Consultas VALUES (2, 2, '2006/06/13', '11:00');
INSERT INTO Consultas VALUES (2, 3, '2006/06/14', '14:00');
INSERT INTO Consultas VALUES (2, 4, '2006/06/14', '17:00');
INSERT INTO Consultas VALUES (3, 1, '2006/06/19', '18:00');
INSERT INTO Consultas VALUES (3, 3, '2006/06/12', '10:00');
INSERT INTO Consultas VALUES (3, 4, '2006/06/19', '13:00');
INSERT INTO Consultas VALUES (4, 4, '2006/06/20', '13:00');
INSERT INTO Consultas VALUES (4, 4, '2006/06/22', '19:30');
