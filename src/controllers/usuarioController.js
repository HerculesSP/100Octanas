var usuarioModel = require("../models/usuarioModel");


function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);
                                    res.json({
                                        idUsuario: resultadoAutenticar[0].idUsuario,
                                        email: resultadoAutenticar[0].email,
                                        nome: resultadoAutenticar[0].nome,
                                        sobrenome: resultadoAutenticar[0].sobrenome,
                                        verificado: resultadoAutenticar[0].verificado,
                                        descricao: resultadoAutenticar[0].descricao,
                                        icon: resultadoAutenticar[0].foto,
                                    });
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                        console.log("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}


function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    const imagem = req.file.filename;
    const {nome, sobrenome, email, senha, dataNascimento} = req.body
    const usuario = { nome, sobrenome, email, senha, dataNascimento, imagem }


        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(usuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    
}

function ultimoAcesso(req, res) {
    const id = req.body.id
        usuarioModel.ultimoAcesso(id)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao atualizar o último cadastro Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    
}
function apagarUsuario (req, res) {
  const idUsuario = req.body.idUsuario;
  usuarioModel.apagarUsuario(idUsuario)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });

};

function listarUsuariosDash (req, res){
    usuarioModel.listarUsuariosDash()
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

function buscarKPIsUsuarios (req, res){
    id = req.query.id;
    usuarioModel.buscarKPIsUsuarios(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

function buscarMensalUsuarios (req, res){
    id = req.query.id;
    usuarioModel.buscarMensalUsuarios(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

function buscarDiarioUsuarios (req, res){
    id = req.query.id;
    usuarioModel.buscarDiarioUsuarios(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

function buscarDonutUsuarios (req, res){
    id = req.query.id;
    usuarioModel.buscarDonutUsuarios(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

module.exports = {
    autenticar,
    cadastrar,
    ultimoAcesso,
    apagarUsuario,
    listarUsuariosDash,
    buscarKPIsUsuarios,
    buscarMensalUsuarios,
    buscarDiarioUsuarios,
    buscarDonutUsuarios
}