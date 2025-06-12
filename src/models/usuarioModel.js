var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, sobrenome, email, verificado, descricao, foto FROM Usuario 
        inner join InfoUsuario on fkUsuario=idUsuario 
        left join Cargo on idCargo=fkCargo 
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

function ultimoAcesso(id){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function UltimoAcesso:");
    var instrucaoSql = `
        update InfoUsuario set UltimoAcesso=now() where fkUsuario=${id};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function apagarUsuario(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function apagarUsuario():", idUsuario);
    //const instrucao = `insert into usuario (nome, email, imagem_perfil) values ('${usuario.nome}', '${usuario.email}', '${usuario.imagem}')`;
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
     var instrucaoSql = `
        update InfoUsuario set ativo = null where fkUsuario=${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function registrarVerificacao(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function registrarVerificação():", idUsuario);
     var instrucaoSql = `
        update InfoUsuario set verificado=1 where fkUsuario=${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function listarUsuariosDash(){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarUsuariosDash:");
    var instrucaoSql = `
        select idUsuario, Sonome from vw_usuarios order by Sonome;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function buscarKPIsUsuarios(id){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarKPIsUsuarios:");
    var instrucaoSql = `
        select nomeCompleto, icon, acessos, inscricao, cargo, ultimo from vw_usuarios where idUsuario=${id} order by nomeCompleto;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}

function buscarMensalUsuarios(id){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarMensalUsuarios:");
    var instrucaoSql = `
            SELECT COUNT(fkUsuario) qtd, DATE_FORMAT(acesso, '%m/%y') mes_ano
                FROM cemOctanas.Usuario_Materia
                WHERE fkUsuario = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -12 MONTH) AND now()
                GROUP BY mes_Ano
                ORDER BY MIN(acesso);
        `;
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql)
}

function buscarDiarioUsuarios(id){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarDiarioUsuarios:");
    var instrucaoSql = `
           SELECT COUNT(fkUsuario) qtd, DATE_FORMAT(acesso, '%d/%m') dia_mes
            FROM cemOctanas.Usuario_Materia
            WHERE fkUsuario = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -7 DAY) AND now()
            GROUP BY dia_mes
            ORDER BY MIN(acesso);
        `;
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql)
}

function buscarDonutUsuarios(id){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarDonutUsuarios:");
    var instrucaoSql = `
SELECT 
    Categoria,
    SUM(valor) total_valor
FROM (SELECT 
        c1.Categoria Categoria, 
        COUNT(*) * 3 valor
    FROM cemOctanas.Usuario_Materia mu
    INNER JOIN cemOctanas.Materia m ON m.idMateria = mu.fkMateria
    INNER JOIN cemOctanas.Usuario u ON u.idUsuario = mu.fkUsuario
    INNER JOIN cemOctanas.Categoria c1 ON m.fkCategoria1 = c1.idCategoria
    WHERE u.idUsuario = ${id}
    GROUP BY c1.Categoria
    UNION 
    SELECT 
        c2.Categoria Categoria, 
        COUNT(*) * 2 valor
    FROM cemOctanas.Usuario_Materia mu
    INNER JOIN cemOctanas.Materia m ON m.idMateria = mu.fkMateria
    INNER JOIN cemOctanas.Usuario u ON u.idUsuario = mu.fkUsuario
    INNER JOIN cemOctanas.Categoria c2 ON m.fkCategoria2 = c2.idCategoria
    WHERE u.idUsuario = ${id}
    GROUP BY c2.Categoria
    UNION 
    SELECT 
        c3.Categoria Categoria, 
        COUNT(*) valor
    FROM cemOctanas.Usuario_Materia mu
    INNER JOIN cemOctanas.Materia m ON m.idMateria = mu.fkMateria
    INNER JOIN cemOctanas.Usuario u ON u.idUsuario = mu.fkUsuario
    INNER JOIN cemOctanas.Categoria c3 ON m.fkCategoria3 = c3.idCategoria
    WHERE u.idUsuario = ${id}
    GROUP BY c3.Categoria
) interesse
GROUP BY Categoria
ORDER BY total_valor desc;
        `;
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql)
}
module.exports = {
    autenticar,
    cadastrar,
    ultimoAcesso,
    apagarUsuario,
    registrarVerificacao,
    listarUsuariosDash,
    buscarKPIsUsuarios,
    buscarMensalUsuarios,
    buscarDiarioUsuarios,
    buscarDonutUsuarios
};