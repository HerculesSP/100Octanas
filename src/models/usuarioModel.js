var database = require("../database/config")

function autenticar(email, senha) {
    var instrucaoSql = `
        SELECT idUsuario, nome, sobrenome, email, verificado, descricao, foto FROM Usuario 
        inner join InfoUsuario on fkUsuario=idUsuario 
        left join Cargo on idCargo=fkCargo 
        WHERE email = '${email}' AND senha = '${senha}' AND ativo = 1 AND banido is null;
    `;
    return database.executar(instrucaoSql);
}

function cadastrar(usuario) {
     var instrucaoSql = `
        CALL cadastrarUsuarioInfo('${usuario.nome}', '${usuario.sobrenome}', '${usuario.email}', '${usuario.dataNascimento}', '${usuario.senha}', '${usuario.imagem}');
    `;
    return database.executar(instrucaoSql)
}

function ultimoAcesso(id){
    var instrucaoSql = `
        update InfoUsuario set UltimoAcesso=now() where fkUsuario=${id};
    `;
    return database.executar(instrucaoSql)
}

function apagarUsuario(idUsuario) {
     var instrucaoSql = `
        update InfoUsuario set ativo = null where fkUsuario=${idUsuario};
    `;
    return database.executar(instrucaoSql)
}

function BanirUsuario(idUsuario) {
     var instrucaoSql = `
        update InfoUsuario set banido = 1 where fkUsuario=${idUsuario};
    `;
    return database.executar(instrucaoSql)
}

function registrarVerificacao(idUsuario) {
     var instrucaoSql = `
        update InfoUsuario set verificado=1 where fkUsuario=${idUsuario};
    `;
    return database.executar(instrucaoSql)
}

function listarUsuariosDash(){
    var instrucaoSql = `
        select idUsuario, Sonome from vw_usuarios order by Sonome;
    `;
    return database.executar(instrucaoSql)
}

function buscarKPIsUsuarios(id){
    var instrucaoSql = `
        select nomeCompleto, icon, acessos, inscricao, cargo, ultimo from vw_usuarios where idUsuario=${id} order by nomeCompleto;
    `;
    return database.executar(instrucaoSql)
}

function buscarMensalUsuarios(id){
    var instrucaoSql = `
            SELECT COUNT(fkUsuario) qtd, DATE_FORMAT(acesso, '%m/%y') mes_ano
                FROM cemOctanas.Usuario_Materia
                WHERE fkUsuario = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -12 MONTH) AND now()
                GROUP BY mes_Ano
                ORDER BY MIN(acesso);
        `;
        return database.executar(instrucaoSql)
}

function buscarDiarioUsuarios(id){
    var instrucaoSql = `
           SELECT COUNT(fkUsuario) qtd, DATE_FORMAT(acesso, '%d/%m') dia_mes
            FROM cemOctanas.Usuario_Materia
            WHERE fkUsuario = ${id} AND acesso BETWEEN DATE_ADD(now(), INTERVAL -7 DAY) AND now()
            GROUP BY dia_mes
            ORDER BY MIN(acesso);
        `;
        return database.executar(instrucaoSql)
}

function buscarDonutUsuarios(id){
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
        return database.executar(instrucaoSql)
}
module.exports = {
    autenticar,
    cadastrar,
    ultimoAcesso,
    apagarUsuario,
    BanirUsuario,
    registrarVerificacao,
    listarUsuariosDash,
    buscarKPIsUsuarios,
    buscarMensalUsuarios,
    buscarDiarioUsuarios,
    buscarDonutUsuarios
};