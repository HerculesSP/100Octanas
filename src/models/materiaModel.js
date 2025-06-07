var database = require("../database/config")
function criarMateria(materia) {
    console.log("ACESSEI O MATERIA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar materia():", materia);
    //const instrucao = `insert into usuario (nome, email, imagem_perfil) values ('${usuario.nome}', '${usuario.email}', '${usuario.imagem}')`;
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
     var instrucaoSql = `
        CALL cadastrarMateria ('${materia.titulo}', 'Só para não ficar vazio', '${materia.link}', '${materia.capa}', '${materia.id}', '${materia.categoria1}', '${materia.categoria2}', '${materia.categoria3}');
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
module.exports = {
    criarMateria,
    listarNormal,
    armazenar
};