const multer = require('multer');

// Diretório onde os arquivos serão salvos
// ATENÇÃO: É necessário manter o diretório 'public' para poder utilizar no front-end
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    let diretorio;
    if (file.fieldname === 'capa') {
      diretorio = 'public/res/img';
    } else if (file.fieldname === 'corpoArquivo[]') {
      diretorio = 'public/res/img';
    } else if (file.fieldname === 'foto'){
      diretorio = 'public/res/icon';
    } else {
    diretorio = 'public/res/outros';
  }
    cb(null, diretorio);
  },

  filename: (req, file, cb) => {
    const extensaoArquivo = file.originalname.split('.').pop();
    const novoNomeArquivo = require('crypto')
      .randomBytes(32)
      .toString('hex');
    cb(null, `${novoNomeArquivo}.${extensaoArquivo}`);
  }
})

module.exports = multer({ storage });