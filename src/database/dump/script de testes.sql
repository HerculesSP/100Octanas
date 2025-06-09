use cemOctanas;
select * from cemOctanas.Usuario;
select * from cemOctanas.InfoUsuario;
insert into cemOctanas.Usuario(nome, sobrenome, dtNasc, senha) values ('Aa', 'AA', '2020-01-01', '1234');
INSERT INTO cemOctanas.InfoUsuario (email, dtInsc, fkUsuario) VALUES ('aa@gmail', NOW(), LAST_INSERT_ID());
CALL cemOctanas.cadastrarUsuarioInfo('aaa', 'bbbb', 'email@email', '2020-01-01', '12345');

SELECT u.idUsuario, u.nome, ui.email, c.descricao FROM Usuario u
        inner join InfoUsuario ui on ui.fkUsuario=u.idUsuario 
        left join Cargo c on c.idCargo=u.fkCargo 
        WHERE ui.email = 'hercules@email.com' AND u.senha = 'Hercules1234567890!' AND ui.ativo = 1 AND ui.banido is null;
        
SELECT u.idUsuario, u.nome, ui.email, c.descricao FROM Usuario u
        left join InfoUsuario ui on ui.fkUsuario=u.idUsuario 
        left join Cargo c on c.idCargo=u.fkCargo 
        WHERE ui.email = 'ssa@aaa' AND u.senha = 'Laranja7!' AND ui.ativo = 1 AND ui.banido is null;
insert into Cargo (descricao) values ('carguin');
update Usuario set fkCargo=1 where idUsuario=5;
drop database cemOctanas;

select * from Materia
inner join Categoria_Materia on fkMateria=idMateria;

insert into Usuario_Materia (fkMateria, fkUsuario) values 
(4,1),
(4,1),
(4,1),
(4,1),
(4,1),
(4,1),
(4,1),
(4,1),
(4,1),
(4,1),
(2,1),
(2,1),
(2,1),
(2,1),
(2,1),
(2,1),
(3,1),
(3,1);

select m.idMateria, m.titulo, m.resumo, m.link, m.capa, m.dtPub, count(mu.fkMateria) 
from Usuario_Materia mu
right join Materia m on m.idMateria=mu.fkMateria 
group by m.idMateria, m.titulo, m.resumo, m.link, m.capa, m.dtPub;
select  id, titulo, resumo, link, capa, acessos, data from vw_materias order by acessos desc;



select * from cemOctanas.Usuario
inner join cemOctanas.InfoUsuario on fkUsuario=idUsuario;
select * from cemOctanas.InfoUsuario;
insert into cemOctanas.Usuario(nome, sobrenome, dtNasc, senha) values ('Aa', 'AA', '2020-01-01', '1234');
INSERT INTO cemOctanas.InfoUsuario (email, dtInsc, fkUsuario) VALUES ('aa@gmail', NOW(), LAST_INSERT_ID());
insert into cemOctanas.Usuario_Materia (fkMateria, fkusuario) values
(4,2), 
(4,2), 
(4,2), 
(4,2), 
(3,2), 
(3,2), 
(3,2), 
(2,2), 
(2,2),
(1,2); 
update cemOctanas.Materia set dtPub ='2025-05-10' where idMateria=1;
update cemOctanas.Materia set dtPub ='2025-01-11' where idMateria=3;
update cemOctanas.Materia set dtPub ='2025-05-12' where idMateria=2;
update cemOctanas.Materia set dtPub ='2025-05-13' where idMateria=4;
select * from cemOctanas.Usuario_Materia;
drop database cemOctanas;
update cemOctanas.Usuario set fkCargo=3 where idUsuario=4;
update cemOctanas.InfoUsuario set ativo=1 where fkUsuario=4;
delete from cemOctanas.Usuario where idUsuario=1;

select * from cemOctanas.Usuario_Materia;
update cemOctanas.Usuario_Materia set acesso='2025-03-02' where sequencial=8;

SELECT 
    COUNT(fkMateria) qtd, DATE_FORMAT(acesso, '%m/%y') mes_ano
FROM cemOctanas.Usuario_Materia
WHERE fkMateria = 1 AND acesso BETWEEN DATE_ADD(now(), INTERVAL -12 MONTH) AND now()
GROUP BY mes_Ano
ORDER BY MIN(acesso);


SELECT 
    COUNT(fkMateria) qtd, DATE_FORMAT(acesso, '%d/%m') dia_mes
FROM cemOctanas.Usuario_Materia
WHERE fkMateria = 1 AND acesso BETWEEN DATE_ADD(now(), INTERVAL -7 DAY) AND now()
GROUP BY dia_mes
ORDER BY MIN(acesso);

drop  PROCEDURE cemOctanas.ultimosDozeMesesMateria;
call cemOctanas.ultimosDozeMesesMateria(4);



INSERT INTO cemOctanas.Usuario (nome, sobrenome, senha, dtNasc, fkCargo) VALUES
('João', 'Silva', 'S3nh@F0rt3', '1998-05-12', 1),
('Maria', 'Santos', 'M@r1@2025', '1985-11-23', 2),
('Carlos', 'Oliveira', 'C@rl0sPWD', '2001-02-28', 3),
('Ana', 'Costa', 'An@Secure1', '1972-09-15', 1),
('Pedro', 'Rocha', 'R0ch@1234', '1995-07-04', 1),
('Fernanda', 'Lima', 'F3rn@Nd@', '1988-12-01', 2),
('Ricardo', 'Almeida', 'R1c@rd0!', '2005-03-19', 1),
('Hércules', 'da Silva Pereira', 'Teste1234!', '1999-08-30', 3),
('Lucas', 'Carvalho', 'Luk@$2025', '1965-04-22', 1),
('Amanda', 'Pereira', '@mAnd@2025', '2003-10-17', 1);

INSERT INTO cemOctanas.Materia (titulo, resumo, link, visivel, capa, dtPub, fkAutor, fkCategoria1, fkCategoria2, fkCategoria3) VALUES
('A Revolução da IA', 'Como a inteligência artificial está transformando indústrias', 'ia-revolucao', 1, 'ia.jpg', NOW(), 2, 5, 12, 18),
('Energias Renováveis', 'O futuro da energia sustentável no Brasil', 'energia-verde', 1, 'energia.jpg', NOW(), 6, 3, 7, 15),
('Educação Digital', 'Novas metodologias de ensino online', 'educacao-digital', 1, 'educacao.jpg', NOW(), 8, 9, 14, 21),
('Mercado de Trabalho 2025', 'As profissões em alta na próxima década', 'trabalho-2025', 1, 'trabalho.jpg', NOW(), 2, 2, 11, 19),
('Saúde Mental', 'Estratégias para combater o estresse moderno', 'saude-mental', 1, 'saude.jpg', NOW(), 6, 4, 8, 17),
('Cidades Inteligentes', 'Tecnologia aplicada ao urbanismo', 'cidades-inteligentes', 1, 'cidades.jpg', NOW(), 8, 1, 6, 13),
('Blockchain', 'A tecnologia por trás das criptomoedas', 'blockchain-tech', 1, 'blockchain.jpg', NOW(), 2, 10, 16, 20),
('Agropecuária 4.0', 'Inovações tecnológicas no campo', 'agro-40', 1, 'agro.jpg', NOW(), 6, 5, 12, 18),
('Realidade Virtual', 'Aplicações práticas em diferentes setores', 'vr-apps', 1, 'vr.jpg', NOW(), 8, 7, 14, 21),
('E-commerce', 'Tendências do comércio eletrônico', 'ecommerce-trends', 1, 'ecommerce.jpg', NOW(), 2, 3, 9, 15),
('Segurança Digital', 'Protegendo dados na era da conexão', 'seguranca-digital', 1, 'seguranca.jpg', NOW(), 6, 4, 10, 19),
('Mobilidade Urbana', 'Novos modelos de transporte nas metrópoles', 'mobilidade', 1, 'mobilidade.jpg', NOW(), 8, 2, 8, 16),
('Biomedicina', 'Avancos no tratamento de doenças crônicas', 'biomedicina', 1, 'bio.jpg', NOW(), 2, 6, 13, 20),
('Games', 'O impacto econômico da indústria de jogos', 'games-industry', 1, 'games.jpg', NOW(), 6, 1, 5, 17);

DELIMITER //
CREATE PROCEDURE  cemOctanas.popular_usuario_materia()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 200 DO
    INSERT INTO cemOctanas.Usuario_Materia (fkUsuario, fkMateria, segundosLidos, acesso)
    VALUES (
      FLOOR(1 + RAND() * 10),            -- Usuário aleatório entre 1 e 10
      FLOOR(1 + RAND() * 14),            -- Matéria aleatória entre 1 e 14
      FLOOR(30 + RAND() * 570),          -- Segundos lidos entre 30 e 600
      NOW() - INTERVAL FLOOR(RAND() * 365) DAY -- Data aleatória nos últimos 12 meses
    );
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;

-- Execute a procedure:
CALL cemOctanas.popular_usuario_materia();
-- Inserção de dados complementares
INSERT INTO cemOctanas.InfoUsuario (email, dtInsc, foto, ativo, banido, verificado, fkUsuario) 
SELECT 
    CONCAT(LOWER(SUBSTRING(nome,1,1)), sobrenome, idUsuario, '@cemoctanas.com'),
    CURDATE(), 
    'default-icon.png', 
    1, 
    NULL, 
    CASE WHEN fkCargo IN (2,3) THEN 1 ELSE 0 END,
    idUsuario 
FROM cemOctanas.Usuario;

INSERT INTO cemOctanas.Newsletter (email, fkUsuario)
SELECT email, idUsuario FROM cemOctanas.InfoUsuario WHERE fkUsuario IS NOT NULL;
update InfoUsuario set UltimoAcesso=now() where fkUsuario=1;
drop view cemOctanas.vw_materias;
 select concat(nome, ' ', sobrenome), foto, cargo from Usuario order by nome;
 
SELECT COUNT(fkUsuario) qtd, DATE_FORMAT(acesso, '%m/%y') mes_ano
                FROM cemOctanas.Usuario_Materia
                WHERE fkMateria = 11 AND acesso BETWEEN DATE_ADD(now(), INTERVAL -12 MONTH) AND now()
                GROUP BY mes_Ano
                ORDER BY MIN(acesso);
                
                
select * from Usuario_Materia where fkUsuario=11;