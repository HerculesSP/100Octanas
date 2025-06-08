var database = require("../database/config")
function criarMateria(materia) {
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar materia():", materia);
    //const instrucao = `insert into usuario (nome, email, imagem_perfil) values ('${usuario.nome}', '${usuario.email}', '${usuario.imagem}')`;
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
     var instrucaoSql = `
      INSERT INTO Materia (titulo, resumo, link, capa, dtPub, fkAutor, fkCategoria1, fkCategoria2, fkCategoria3)
        VALUES ('${materia.titulo}', 'Só para não ficar vazio', '${materia.link}', '${materia.capa}', NOW(),  '${materia.id}', '${materia.categoria1}', '${materia.categoria2}', '${materia.categoria3}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}
function listarNormal(ordem, pesquisa, limite){
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarNormal:", ordem, pesquisa, limite);
    var instrucaoSql = `
        select  id, titulo, resumo, link, capa, data from vw_materias ${pesquisa} order by ${ordem} desc limit ${limite};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}
function armazenar (idMateria, idUsuario){
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function armazenar():", idMateria, idUsuario);
    var instrucaoSql = `
        insert into cemOctanas.Usuario_Materia (fkMateria, fkusuario) values (${idMateria},${idUsuario}); 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}
function listarMateriasDash(){
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarMateriasDash:");
    var instrucaoSql = `
        select id, titulo from vw_materias order by titulo;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function buscarKPIsMateria(id){
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarMateriasDash:");
    var instrucaoSql = `
        select titulo, categoria1, categoria2, categoria3, data, autor, acessos from vw_materias where id= ${id} order by titulo;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function buscarIdadeMateria(id){
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarIdadeMateria:");
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
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function buscarMensalMateria(id){
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarIdadeMateria:");
    var instrucaoSql = `
        SELECT COUNT(fkMateria) qtd, DATE_FORMAT(acesso, '%m/%y') mes_ano
            FROM cemOctanas.Usuario_Materia
            WHERE fkMateria = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -12 MONTH) AND now()
            GROUP BY mes_Ano
            ORDER BY MIN(acesso);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}
module.exports = {
    criarMateria,
    listarNormal,
    armazenar,
    listarMateriasDash,
    buscarKPIsMateria,
    buscarIdadeMateria,
    buscarMensalMateria
};