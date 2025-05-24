var categoriaModel = require("../models/categoriaModel");

exports.listarCategorias = (req, res) => {
  categoriaModel.listarCategorias().then((resultado) => {
    if (resultado.length > 0) {
      console.log('foi')
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar as categorias: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}