const express = require('express');
const router = express.Router();
const upload = require('../config/configUpload');
const materiaController = require('../controllers/materiaController');

router.get("/listarMaterias", function (req, res) {
    materiaController.listarMaterias(req, res);
});

router.get("/listarMateriasDash", function (req, res) {
    materiaController.listarMateriasDash(req, res);
});

router.get("/buscarKPIsMaterias", function (req, res) {
    materiaController.buscarKPIsMateria(req, res);
});

router.get("/buscarIdadeMaterias", function (req, res) {
    materiaController.buscarIdadeMateria(req, res);
});

router.get("/buscarMensalMaterias", function (req, res) {
    materiaController.buscarMensalMateria(req, res);
});

router.get("/buscarDiarioMaterias", function (req, res) {
    materiaController.buscarDiarioMateria(req, res);
});

router.post("/ApagarMateria", function (req, res) {
    materiaController.ApagarMateria(req, res);
});

router.post(
  '/enviarMateria',
  upload.fields([
    { name: 'capa', maxCount: 1 },
    { name: 'corpoArquivo[]' }
  ]),
  (req, res) => {
    materiaController.criarMateria(req, res);
  }
);

router.post("/inserirInformacoes", function (req, res) {
    materiaController.armazenar(req, res);
});

module.exports = router;
