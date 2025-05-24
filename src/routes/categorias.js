var express = require("express");
var router = express.Router();
var categoriaController = require("../controllers/categoriaController");

router.post("/bucarCategorias", function (req, res) {
    categoriaController.buscarCategorias(req, res);
});

router.get("/listarCategorias", function (req, res) {
    categoriaController.listarCategorias(req, res);
});

module.exports = router;