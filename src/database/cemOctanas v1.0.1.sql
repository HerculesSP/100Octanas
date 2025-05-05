-- -----------------------------------------------------
-- Banco cemOctanas
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS cemOctanas ;

-- -----------------------------------------------------
-- Tabela Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Usuario (
  idUsuario INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  verificado TINYINT NOT NULL,
  foto VARCHAR(45) NULL,
  dtNasc DATE NOT NULL,
  dtInsc DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(45) NOT NULL,
  ativo TINYINT NOT NULL,
  PRIMARY KEY (idUsuario)
);


-- -----------------------------------------------------
-- Tabela Cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Cargo (
  idCargo INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCargo)
);


-- -----------------------------------------------------
-- Tabela Funcionario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Funcionario (
  fkUsuario INT NOT NULL,
  fkCargo INT NOT NULL,
  PRIMARY KEY (fkUsuario),
  CONSTRAINT fk_Autor_Usuario
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario),
  CONSTRAINT fk_Autor_Cargo1
    FOREIGN KEY (fkCargo)
    REFERENCES cemOctanas.Cargo (idCargo)
);


-- -----------------------------------------------------
-- Tabela Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Materia (
  idMateria INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  resumo VARCHAR(45) NOT NULL,
  link VARCHAR(45) NOT NULL,
  visivel TINYINT NOT NULL,
  fkAutor INT NOT NULL,
  PRIMARY KEY (idMateria),
  CONSTRAINT fk_Materia_Funcionario
    FOREIGN KEY (fkAutor)
    REFERENCES cemOctanas.Funcionario (fkUsuario)
);


-- -----------------------------------------------------
-- Tabela Usuario_Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Usuario_Materia (
  fkUsuario INT NOT NULL,
  fkMateria INT NOT NULL,
  sequencial INT NOT NULL,
  segundosLidos INT,
  acesso DATETIME NOT NULL,
  PRIMARY KEY (fkUsuario, fkMateria, sequencial),
  CONSTRAINT fk_Usuario_has_Materia_Usuario
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario),
  CONSTRAINT fk_Usuario_has_Materia_Materia1
    FOREIGN KEY (fkMateria)
    REFERENCES cemOctanas.Materia (idMateria)
);


-- -----------------------------------------------------
-- Tabela Newsletter
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Newsletter (
  idNewsletter INT NOT NULL,
  email VARCHAR(45) NULL,
  fkUsuario INT NULL,
  PRIMARY KEY (idNewsletter),
  CONSTRAINT fk_Newsletter_Usuario
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario)
);


-- -----------------------------------------------------
-- Tabela Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Categoria (
  idCategoria INT NOT NULL,
  Categoria VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCategoria)
);


-- -----------------------------------------------------
-- Tabela Categoria_Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Categoria_Materia (
  fkMateria INT NOT NULL,
  fkCategoria INT NOT NULL,
  nivel TINYINT NOT NULL,
  PRIMARY KEY (fkMateria, fkCategoria, nivel),
  CONSTRAINT fk_Categoria_Materia1
    FOREIGN KEY (fkCategoria)
    REFERENCES cemOctanas.Categoria (idCategoria),
  CONSTRAINT fk_Categoria_Materia2
    FOREIGN KEY (fkMateria)
    REFERENCES cemOctanas.Materia (idMateria)
);


-- -----------------------------------------------------
-- Tabela Contato
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Contato (
  idContato INT NOT NULL,
  ddi CHAR(2) NOT NULL,
  ddd CHAR(2) NOT NULL,
  telefone CHAR(9) NOT NULL,
  email VARCHAR(45) NOT NULL,
  fkUsuario INT NOT NULL UNIQUE,
  PRIMARY KEY (idContato),
  CONSTRAINT fk_Contato_Usuario
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario)
);


-- -----------------------------------------------------
-- Tabela Imagem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Imagem (
  idImagem INT NOT NULL,
  link VARCHAR(45) NOT NULL,
  legenda VARCHAR(45) NULL,
  PRIMARY KEY (idImagem)
);


-- -----------------------------------------------------
-- Tabela Imagem_Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Imagem_Materia (
  fkMateria INT NOT NULL,
  fkImagem INT NOT NULL,
  PRIMARY KEY (fkMateria, fkImagem),
  CONSTRAINT fk_Imagem_Materia1
    FOREIGN KEY (fkImagem)
    REFERENCES cemOctanas.Imagem (idImagem),
  CONSTRAINT fk_Imagem_Materia2
    FOREIGN KEY (fkMateria)
    REFERENCES cemOctanas.Materia (idMateria)
);

-- -----------------------------------------------------
-- Procedimento
-- -----------------------------------------------------