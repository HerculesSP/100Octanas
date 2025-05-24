var database = require("../database/config");

function listarCategorias() {

  var instrucaoSql = `SELECT * FROM Categoria`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
module.exports = {
  listarCategorias
}