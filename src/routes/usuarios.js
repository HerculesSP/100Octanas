var express = require("express");
var router = express.Router();
const upload = require('../config/configUpload');
var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar",  upload.single('foto'), function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.post("/apagarUsuario", function (req, res) {
    usuarioController.apagarUsuario(req, res);
});

router.post("/ultimoAcesso", function (req, res) {
    usuarioController.ultimoAcesso(req, res);
});

router.get("/listarUsuariosDash", function (req, res) {
    usuarioController.listarUsuariosDash(req, res);
});

router.get("/buscarKPIsUsuarios", function (req, res) {
    usuarioController.buscarKPIsUsuarios(req, res);
});

router.get("/buscarMensalUsuarios", function (req, res) {
    usuarioController.buscarMensalUsuarios(req, res);
});

router.get("/buscarDiarioUsuarios", function (req, res) {
    usuarioController.buscarDiarioUsuarios(req, res);
});

module.exports = router;