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
-- Tabela cemOctanas.Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Materia (
  idMateria INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  resumo VARCHAR(300) NOT NULL,
  link VARCHAR(120) NOT NULL,
  visivel TINYINT NOT NULL DEFAULT 1,
  capa VARCHAR(69) NOT NULL,
  dtPub date,
  fkAutor INT NOT NULL,
  PRIMARY KEY (idMateria),
  INDEX idx_titulo (titulo),
  CONSTRAINT fk_Materia_Autor
    FOREIGN KEY (fkAutor)
    REFERENCES cemOctanas.Usuario (idUsuario)
);


-- -----------------------------------------------------
-- Tabela cemOctanas.Usuario_Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Usuario_Materia (
  sequencial INT NOT NULL AUTO_INCREMENT,
  fkUsuario INT NOT NULL,
  fkMateria INT NOT NULL,
  segundosLidos INT,
  acesso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (sequencial, fkUsuario, fkMateria),
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
  foto VARCHAR(69) NOT NULL DEFAULT 'default-icon.png',
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

CREATE PROCEDURE cemOctanas.cadastrarUsuarioInfo(
    IN p_nome VARCHAR(75),
    IN p_sobrenome VARCHAR(150),
    IN p_email VARCHAR(200),
    IN p_dtNasc DATE,
    IN p_senha VARCHAR(20),
    IN p_imagem VARCHAR(69)
)
BEGIN
    INSERT INTO cemOctanas.Usuario (nome, sobrenome, dtNasc, senha)
    VALUES (p_nome, p_sobrenome, p_dtNasc, p_senha);

    INSERT INTO cemOctanas.InfoUsuario (email, dtInsc, foto, fkUsuario)
    VALUES (p_email, NOW(), p_imagem, LAST_INSERT_ID());
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Procedimento  cadastrarMateria
-- -----------------------------------------------------
DELIMITER $$

CREATE PROCEDURE cemOctanas.cadastrarMateria(
    IN p_titulo VARCHAR(100),
    IN p_resumo VARCHAR(300),
    IN p_link VARCHAR(120),
    IN p_capa VARCHAR(69),
    IN p_autor int,
    IN p_categoria1 int,
    IN p_categoria2 int,
    IN p_categoria3 int
)
BEGIN
	DECLARE id int;
    INSERT INTO cemOctanas.Materia (titulo, resumo, link, capa, dtPub, fkAutor)
    VALUES (p_titulo, p_resumo, p_link, p_capa, NOW(), p_autor);
    set id = LAST_INSERT_ID();
    INSERT INTO cemOctanas.Categoria_Materia (fkMateria, fkCategoria, nivel)
    VALUES (id, p_categoria1, 3), (id, p_categoria2, 2), (id, p_categoria3, 1);
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
    

-- -----------------------------------------------------
-- View vw_materias
-- -----------------------------------------------------
create view cemOctanas.vw_materias as
select m.idMateria id, m.titulo titulo, m.resumo resumo, m.link link, m.capa capa, m.dtPub data, count(mu.fkMateria) acessos
from Usuario_Materia mu
right join Materia m on m.idMateria=mu.fkMateria 
group by m.idMateria, m.titulo, m.resumo, m.link, m.capa, m.dtPub;
    

-- -----------------------------------------------------
-- Inserindo as categorias
-- -----------------------------------------------------
INSERT INTO cemOctanas.Categoria (Categoria) VALUES
  ('Fórmula 1'),
  ('WEC'),
  ('Fórmula E'),
  ('Rali'),
  ('MotoGP'),
  ('Stock Car'),
  ('NASCAR'),
  ('Audi'),
  ('BMW'),
  ('Mercedes-Benz'),
  ('Ferrari'),
  ('Porsche'),
  ('Lançamentos'),
  ('Mercado'),
  ('Testes'),
  ('Clássicos'),
  ('Tecnologia'),
  ('Elétricos'),
  ('Eventos'),
  ('JDM'),
  ('Mercado de usados');
