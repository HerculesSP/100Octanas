-- -----------------------------------------------------
-- Banco cemOctanas
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS cemOctanas ;

-- -----------------------------------------------------
-- Tabela Cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Cargo (
  idCargo INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCargo)
);


-- -----------------------------------------------------
-- Tabela Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Usuario (
  idUsuario INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  verificado TINYINT(1) NOT NULL DEFAULT 0,
  foto VARCHAR(45) NULL,
  dtNasc DATE NOT NULL,
  dtInsc DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  fkCargo INT DEFAULT NULL,
  CONSTRAINT fk_Usuario_Cargo
    FOREIGN KEY (fkCargo)
    REFERENCES cemOctanas.Cargo(idCargo),
  PRIMARY KEY (idUsuario)
);


-- -----------------------------------------------------
-- Tabela Imagem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Capa (
  idCapa INT NOT NULL,
  link VARCHAR(45) NOT NULL,
  legenda VARCHAR(45) NULL,
  PRIMARY KEY (idCapa)
);


-- -----------------------------------------------------
-- Tabela Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Materia (
  idMateria INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  resumo VARCHAR(45) NOT NULL,
  link VARCHAR(45) NOT NULL,
  visivel TINYINT(1) NOT NULL DEFAULT 1,
  fkAutor INT NOT NULL,
  fkCapa INT NOT NULL,
  PRIMARY KEY (idMateria),
  CONSTRAINT fk_Materia_Autor
    FOREIGN KEY (fkAutor)
    REFERENCES cemOctanas.Usuario (idUsuario),
  CONSTRAINT fk_Materia_Capa
    FOREIGN KEY (fkCapa)
    REFERENCES cemOctanas.Capa (idCapa)
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
-- Procedimento
-- -----------------------------------------------------


-- -----------------------------------------------------
-- View vw_kpis_usuario
-- -----------------------------------------------------
create view cemOctanas.vw_kpis_usuario as
select count(fkUsuario) materias_lidas, round(avg(segundosLidos),0) tempo_medio 
	from cemOctanas.Usuario_Materia group by fkusuario;


-- -----------------------------------------------------
-- View vw_kpis_materia
-- -----------------------------------------------------
create view cemOctanas.vw_kpis_materia as
select count(fkMateria) quantidade_acessos, round(avg(segundosLidos),0) tempo_medio 
	from cemOctanas.Usuario_Materia group by fkMateria;
    
    
select * from cemOctanas.vw_kpis_usuario;