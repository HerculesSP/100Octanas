const multer = require('multer');

// Diretório onde os arquivos serão salvos
// ATENÇÃO: É necessário manter o diretório 'public' para poder utilizar no front-end
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    let diretorio;
    if (req.body.local === '1') {
      diretorio = 'public/res/icon';
    } else if (req.body.local === '2') {
      diretorio = 'public/res/img';
    } else {
      diretorio = 'public/res/outros';
    }
    cb(null, diretorio);
  },

  filename: (req, file, cb) => {
    const extensaoArquivo = file.originalname.split('.').pop();
    const novoNomeArquivo = require('crypto')
      .randomBytes(64)
      .toString('hex');
    cb(null, `${novoNomeArquivo}.${extensaoArquivo}`);
  }
});

module.exports = multer({ storage });