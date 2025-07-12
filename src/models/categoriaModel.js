var database = require("../database/config");

function listarCategorias() {

  var instrucaoSql = `SELECT * FROM Categoria`;
  return database.executar(instrucaoSql);
}
module.exports = {
  listarCategorias
}