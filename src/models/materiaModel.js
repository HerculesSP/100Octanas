var database = require("../database/config")

function criarMateria(materia) {
     var instrucaoSql = `
      INSERT INTO Materia (titulo, link, capa, dtPub, fkAutor, fkCategoria1, fkCategoria2, fkCategoria3)
        VALUES ('${materia.titulo}', '${materia.link}', '${materia.capa}', NOW(),  '${materia.id}', '${materia.categoria1}', '${materia.categoria2}', '${materia.categoria3}');
    `;
    return database.executar(instrucaoSql)
}

function listarNormal(ordem, pesquisa, limite){
    var instrucaoSql = `
        select  id, titulo, link, capa, data from vw_materias ${pesquisa} order by ${ordem} desc limit ${limite};
    `;
    return database.executar(instrucaoSql)
}

function listarLidas(pesquisa, limite, id){
    var instrucaoSql = `
        select distinct m.idMateria id, m.titulo titulo, m.link link, m.capa capa, m.dtPub data, MAX(mu.acesso) acesso
            from cemOctanas.Usuario_Materia mu
            right join cemOctanas.Materia m on m.idMateria=mu.fkMateria
            ${pesquisa} and m.visivel = 1 and mu.fkUsuario=${id}
            group by id, titulo, link, capa, data
            order by acesso desc
            limit ${limite};
    `;
    return database.executar(instrucaoSql)
}

function armazenar (idMateria, idUsuario){
    var instrucaoSql = `
        insert into cemOctanas.Usuario_Materia (fkMateria, fkusuario) values (${idMateria},${idUsuario}); 
    `;
    return database.executar(instrucaoSql)
}

function ApagarMateria(idMateria){
    var instrucaoSql = `
        update Materia set visivel=0 where idMateria=${idMateria}; 
    `;
    return database.executar(instrucaoSql)
}

function listarMateriasDash(){
    var instrucaoSql = `
        select id, titulo from vw_materias order by titulo;
    `;
    return database.executar(instrucaoSql)
}

function buscarKPIsMateria(id){
    var instrucaoSql = `
        select titulo, categoria1, categoria2, categoria3, data, autor, acessos from vw_materias where id= ${id} order by titulo;
    `;
    return database.executar(instrucaoSql)
}

function buscarIdadeMateria(id){
    var instrucaoSql = `
        select case when TIMESTAMPDIFF(year, u.dtNasc, NOW()) < 30 then '18 a 29 anos'
			when  TIMESTAMPDIFF(year, u.dtNasc, NOW()) < 50 then '30 a 49 anos'
            when  TIMESTAMPDIFF(year, u.dtNasc, NOW()) < 65 then '50 a 64 anos'
            else '65 anos ou mais'
            end Idade, count(*) qtd
	from cemOctanas.Usuario_Materia mu
    inner join cemOctanas.Usuario u on mu.fkUsuario = u.idUsuario
    inner join cemOctanas.Materia m on mu.fkMateria = m.idMateria
    where fkMateria=${id}
    group by Idade
    order by Idade;
    `;
    return database.executar(instrucaoSql)
}

function buscarMensalMateria(id){
    var instrucaoSql = `
        SELECT COUNT(fkMateria) qtd, DATE_FORMAT(acesso, '%m/%y') mes_ano
            FROM cemOctanas.Usuario_Materia
            WHERE fkMateria = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -12 MONTH) AND now()
            GROUP BY mes_Ano
            ORDER BY MIN(acesso);
    `;
    return database.executar(instrucaoSql)
}

function buscarDiarioMateria(id){
    var instrucaoSql = `
       SELECT COUNT(fkMateria) qtd, DATE_FORMAT(acesso, '%d/%m') dia_mes
        FROM cemOctanas.Usuario_Materia
        WHERE fkMateria = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -7 DAY) AND now()
        GROUP BY dia_mes
        ORDER BY MIN(acesso);
    `;
    return database.executar(instrucaoSql)
}
module.exports = {
    criarMateria,
    listarNormal,
    listarLidas,
    armazenar,
    listarMateriasDash,
    buscarKPIsMateria,
    buscarIdadeMateria,
    buscarMensalMateria,
    buscarDiarioMateria,
    ApagarMateria
};