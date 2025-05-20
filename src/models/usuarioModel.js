var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, email, descricao FROM Usuario 
        inner join InfoUsuario on fkUsuario=idUsuario 
        inner join Cargo on idCargo=fkCargo 
        WHERE email = '${email}' AND senha = '${senha}' AND ativo = 1 AND banido is null;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(usuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", usuario);
    //const instrucao = `insert into usuario (nome, email, imagem_perfil) values ('${usuario.nome}', '${usuario.email}', '${usuario.imagem}')`;
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
     var instrucaoSql = `
        CALL cadastrarUsuarioInfo('${usuario.nome}', '${usuario.sobrenome}', '${usuario.email}', '${usuario.dataNascimento}', '${usuario.senha}', '${usuario.imagem}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

module.exports = {
    autenticar,
    cadastrar
};