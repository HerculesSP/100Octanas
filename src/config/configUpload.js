const multer = require('multer');

// Diretório onde os arquivos serão salvos
// ATENÇÃO: É necessário manter o diretório 'public' para poder utilizar no front-end
const diretorioIcon = 'public/res/icon';
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, diretorioIcon) 
  },
  
  filename: (req, file, cb) => {
    const extensaoArquivo = file.originalname.split('.')[1];

    const novoNomeArquivo = require('crypto')
      .randomBytes(64)
      .toString('hex');


    cb(null, `${novoNomeArquivo}.${extensaoArquivo}`)
  }
});
module.exports = multer({ storage });