const fs = require('fs');
const ejs = require('ejs');
const path = require('path');
var materiaModel = require("../models/materiaModel");


exports.criarMateria = (req, res) => {
  const capa = req.files['capa'] ? req.files['capa'][0].filename : null;
  const {titulo, link, local, categoria1, categoria2, categoria3, tipo, id, nome, sobrenome, icon, corpoTexto } = req.body;
  const materia = {titulo, link, capa, categoria1, categoria2, categoria3, id}
  const arquivosCorpo = req.files['corpoArquivo[]'] || [];
  if (corpoTexto && !Array.isArray(corpoTexto)) corpoTexto = [corpoTexto];
  console.log('--- DADOS DA MATÉRIA ---');
  console.log('Capa:', capa);
  console.log('Título:', titulo);
  console.log('Link:', link);
  console.log('Local:', local);
  console.log('Categoria1:', categoria1);
  console.log('Categoria2:', categoria2);
  console.log('Categoria3:', categoria3);
  console.log('ID:', id);
  console.log('Tipos:', tipo);
  console.log('Arquivos do corpo:', arquivosCorpo.map(f => f.filename));
  console.log('Textos/links do corpo:', corpoTexto);
  let text = '';
  let txtIndex = 0;
  let imgIndex = 0;
  for (let i = 0; i < tipo.length; i++) {
    if (tipo[i] === 'Subtítulo') {
      text += `<h2>${corpoTexto[txtIndex++]}</h2>\n`;
    } else if (tipo[i] === 'Parágrafo') {
      text += `<p>${corpoTexto[txtIndex++]}</p>\n`;
    } else if (tipo[i] === 'Vídeo') {
      text += `<iframe src="${corpoTexto[txtIndex++]}" frameborder="0" allowfullscreen></iframe>\n`;
    } else if (tipo[i] === 'Imagem') {
      const imgFile = arquivosCorpo[imgIndex++];
      text += `<img src="../img/${imgFile.filename}">\n`;
    }
  }
  const hoje = new Date();
  const dataAtual = hoje.toLocaleDateString('pt-BR');
  console.log(text)
  ejs.renderFile('src/views/template.ejs', { Titulo: titulo, foto_jornalista:icon, Nome_do_jornalista:(nome + ' ' + sobrenome), data:dataAtual, capa_materia:capa, conteudo:text }, (err, html) => {
  if (err) {
    console.error('Erro ao renderizar EJS:', err);
    return res.status(500).send('Erro ao gerar página');
  }
  const filePath = path.join(__dirname, '../../public/res/materias/', `${link}.html`);
  fs.writeFile(filePath, html, (err) => {
    if (err) {
      console.error('Erro ao salvar arquivo HTML:', err);
      return res.status(500).send('Erro ao salvar página');
    }
    materiaModel.criarMateria(materia)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
  });
});
};

exports.listarMaterias = (req, res) => {
  const ordem =req.query.ordem;
  const pesquisa1 =req.query.pesquisa;
  const limite = req.query.limit;
  const pesquisa = `where titulo like '%${pesquisa1}%'`
  console.log(ordem, pesquisa, limite, 'a')
  if (ordem=='data' || ordem == 'acessos'){
    materiaModel.listarNormal(ordem, pesquisa, limite)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
  } /*else {
    materiaModel.listarRecomendados(pesquisa)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
  }*/
};

exports.armazenar = (req, res) => {
  const idMateria = req.body.idMateria;
  const idUsuario = req.body.idUsuario;
  materiaModel.armazenar(idMateria, idUsuario)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });

};

exports.listarMateriasDash = (req, res) => {
    materiaModel.listarMateriasDash()
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

exports.buscarKPIsMateria = (req, res) => {
    const id =req.query.id;
    materiaModel.buscarKPIsMateria(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};

exports.buscarIdadeMateria = (req, res) => {
    const id =req.query.id;
    materiaModel.buscarIdadeMateria(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};
exports.buscarMensalMateria = (req, res) => {
    const id =req.query.id;
    materiaModel.buscarMensalMateria(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};
exports.buscarDiarioMateria = (req, res) => {
    const id =req.query.id;
    materiaModel.buscarDiarioMateria(id)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
};
