-- -----------------------------------------------------
-- Banco cemOctanas
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS cemOctanas ;

-- -----------------------------------------------------
-- Tabela cemOctanas.Cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Cargo (
  idCargo INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(70) NOT NULL,
  PRIMARY KEY (idCargo)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(75) NOT NULL,
  sobrenome VARCHAR(150) NOT NULL,
  senha VARCHAR(20) NOT NULL,
  dtNasc DATE NOT NULL,
  fkCargo INT NULL,
  PRIMARY KEY (idUsuario),
  INDEX idx_nome (nome),
  CONSTRAINT fk_Usuario_Cargo
    FOREIGN KEY (fkCargo)
    REFERENCES cemOctanas.Cargo (idCargo)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Capa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Capa (
  idCapa INT NOT NULL AUTO_INCREMENT,
  link VARCHAR(100) NOT NULL,
  legenda VARCHAR(75) NULL,
  PRIMARY KEY (idCapa)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Materia (
  idMateria INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  resumo VARCHAR(300) NOT NULL,
  link VARCHAR(120) NOT NULL,
  visivel TINYINT NOT NULL DEFAULT 1,
  fkAutor INT NOT NULL,
  fkCapa INT NOT NULL,
  PRIMARY KEY (idMateria),
  INDEX idx_titulo (titulo),
  CONSTRAINT fk_Materia_Autor
    FOREIGN KEY (fkAutor)
    REFERENCES cemOctanas.Usuario (idUsuario),
  CONSTRAINT fk_Materia_Capa
    FOREIGN KEY (fkCapa)
    REFERENCES cemOctanas.Capa (idCapa)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Usuario_Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Usuario_Materia (
  fkUsuario INT NOT NULL,
  fkMateria INT NOT NULL,
  sequencial INT NOT NULL,
  segundosLidos INT,
  acesso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (fkUsuario, fkMateria, sequencial),
  INDEX idx_materia_usuario (fkMateria, fkUsuario),
  INDEX idx_usuario_materia (fkUsuario, fkMateria),
  CONSTRAINT fk_Usuario_Materia
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario),
  CONSTRAINT fk_Materia_Usuario
    FOREIGN KEY (fkMateria)
    REFERENCES cemOctanas.Materia (idMateria)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Newsletter
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Newsletter (
  idNewsletter INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(200) NOT NULL,
  fkUsuario INT NULL,
  PRIMARY KEY (idNewsletter),
  INDEX idx_email_newsletter (email),
  CONSTRAINT fk_Newsletter_Usuario
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Categoria (
  idCategoria INT NOT NULL AUTO_INCREMENT,
  Categoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (idCategoria),
  INDEX idx_categoria (Categoria)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Categoria_Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Categoria_Materia (
  fkMateria INT NOT NULL,
  fkCategoria INT NOT NULL,
  nivel TINYINT NOT NULL,
  PRIMARY KEY (fkMateria, fkCategoria, nivel),
  INDEX idx_materia (fkMateria, fkCategoria),
  CONSTRAINT fk_Categoria_Materia
    FOREIGN KEY (fkCategoria)
    REFERENCES cemOctanas.Categoria (idCategoria),
  CONSTRAINT fk_Materia_Categoria
    FOREIGN KEY (fkMateria)
    REFERENCES cemOctanas.Materia (idMateria)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.InfoUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.InfoUsuario (
  idContato INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(200) NOT NULL,
  dtInsc DATE NOT NULL,
  foto VARCHAR(70) NOT NULL DEFAULT 'default-icon.png',
  ativo TINYINT NULL DEFAULT 1,
  banido TINYINT NULL,
  verificado TINYINT NOT NULL DEFAULT 0,
  fkUsuario INT NOT NULL,
  PRIMARY KEY (idContato),
  UNIQUE INDEX unique_email (email, ativo),
  UNIQUE INDEX unique_bloqueado (email, banido),
  INDEX idx_email (email),
  CONSTRAINT fk_Contato_Usuario
    FOREIGN KEY (fkUsuario)
    REFERENCES cemOctanas.Usuario (idUsuario)
);

-- -----------------------------------------------------
-- Procedimento  cadastrarUsuarioInfo
-- -----------------------------------------------------
DELIMITER $$

CREATE PROCEDURE cadastrarUsuarioInfo(
    IN p_nome VARCHAR(100),
    IN p_sobrenome VARCHAR(100),
    IN p_email VARCHAR(255),
    IN p_dtNasc DATE,
    IN p_senha VARCHAR(100)
)
BEGIN
    -- Inserir na tabela Usuario
    INSERT INTO cemOctanas.Usuario (nome, sobrenome, dtNasc, senha)
    VALUES (p_nome, p_sobrenome, p_dtNasc, p_senha);

    INSERT INTO cemOctanas.InfoUsuario (email, dtInsc, fkUsuario)
    VALUES (p_email, NOW(), LAST_INSERT_ID());
END$$

DELIMITER ;

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