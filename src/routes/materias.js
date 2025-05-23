const express = require('express');
const router = express.Router();
const upload = require('../config/configUpload');
const materiaController = require('../controllers/materiaController');

//router.get('/', materiaController.mostarMateria);
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


module.exports = router;
