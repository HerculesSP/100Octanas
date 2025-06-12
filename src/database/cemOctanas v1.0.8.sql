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
  fkCargo INT NOT NULL DEFAULT 1,
  PRIMARY KEY (idUsuario),
  INDEX idx_nome (nome),
  CONSTRAINT fk_Usuario_Cargo
    FOREIGN KEY (fkCargo)
    REFERENCES cemOctanas.Cargo (idCargo)
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
-- Tabela cemOctanas.Materia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.Materia (
  idMateria INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  link VARCHAR(120) NOT NULL,
  visivel TINYINT NOT NULL DEFAULT 1,
  capa VARCHAR(69) NOT NULL,
  dtPub DATETIME,
  fkAutor INT NOT NULL,
  fkCategoria1 INT NOT NULL,
  fkCategoria2 INT NOT NULL,
  fkCategoria3 INT NOT NULL,
  PRIMARY KEY (idMateria),
  INDEX idx_titulo (titulo),
  CONSTRAINT fk_Materia_Autor
    FOREIGN KEY (fkAutor)
    REFERENCES cemOctanas.Usuario (idUsuario),
  CONSTRAINT fk_Materia_Categoria1
    FOREIGN KEY (fkCategoria1)
    REFERENCES cemOctanas.Categoria (idCategoria),
  CONSTRAINT fk_Materia_Categoria2
    FOREIGN KEY (fkCategoria2)
    REFERENCES cemOctanas.Categoria (idCategoria),
  CONSTRAINT fk_Materia_Categoria3
    FOREIGN KEY (fkCategoria3)
    REFERENCES cemOctanas.Categoria (idCategoria)
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
-- Tabela cemOctanas.InfoUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cemOctanas.InfoUsuario (
  idContato INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(200) NOT NULL,
  dtInsc TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UltimoAcesso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  foto VARCHAR(69) NOT NULL DEFAULT 'default-icon.png',
  ativo TINYINT NULL DEFAULT 1,
  banido TINYINT NULL,
  verificado TINYINT NOT NULL DEFAULT 0,
  fkUsuario INT NOT NULL,
  PRIMARY KEY (idContato),
  UNIQUE INDEX unique_email (email, ativo),
  UNIQUE INDEX unique_bloqueado (email, ativo, banido),
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

    INSERT INTO cemOctanas.InfoUsuario (email, foto, fkUsuario)
    VALUES (p_email, p_imagem, LAST_INSERT_ID());
END$$

DELIMITER ;


-- -----------------------------------------------------
-- View vw_materias
-- -----------------------------------------------------
create view cemOctanas.vw_materias as
select m.idMateria id, m.titulo titulo, m.link link, m.capa capa, m.dtPub data, count(mu.fkMateria) acessos, 
	concat(u.nome, ' ', u.sobrenome) autor, c1.Categoria categoria1, c2.Categoria categoria2, c3.Categoria categoria3
from cemOctanas.Usuario_Materia mu
right join cemOctanas.Materia m on m.idMateria=mu.fkMateria
inner join cemOctanas.Usuario u on u.idUsuario = m.fkAutor
inner join cemOctanas.Categoria c1 on m.fkCategoria1= c1.idCategoria
inner join cemOctanas.Categoria c2 on m.fkCategoria2= c2.idCategoria
inner join cemOctanas.Categoria c3 on m.fkCategoria3= c3.idCategoria
where m.visivel = 1
group by id, titulo, link, capa, data, nome, categoria1, categoria2, categoria3;
    

-- -----------------------------------------------------
-- View vw_usuarios
-- -----------------------------------------------------
create view cemOctanas.vw_usuarios as
select u.idUsuario, concat(u.nome, ' ', u.sobrenome) nomeCompleto, u.nome Sonome, ui.foto icon, count(mu.fkUsuario) acessos, 
descricao cargo, dtInsc inscricao, UltimoAcesso ultimo
from cemOctanas.Usuario_Materia mu
right join cemOctanas.Materia m on m.idMateria=mu.fkMateria
inner join cemOctanas.Usuario u on u.idUsuario = mu.fkUsuario
inner join cemOctanas.InfoUsuario ui on ui.fkUsuario = u.idUsuario
inner join cemOctanas.Cargo c on c.idCargo = u.fkCargo
where ui.ativo=1 and ui.banido is null
group by idUsuario, Sonome, icon, cargo, inscricao, nomeCompleto, ultimo;

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

-- -----------------------------------------------------
-- Inserindo os cargos
-- -----------------------------------------------------
INSERT INTO cemOctanas.Cargo (descricao) VALUES
('Leitor'),
('Jornalista'),
('Redator');
 
