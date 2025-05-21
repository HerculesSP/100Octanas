const fs = require('fs');
const ejs = require('ejs');

exports.mostrarMateria = (req, res) => {
  res.sendFile('public/index.html', { root: '.' });
};

exports.criarMateria = (req, res) => {
  const sessionId = req.sessionID;  
  const { capa, titulo, legenda, link, local, categoria1, categoria2, categoria3, tipo, corpo } = req.body;
  console.log(capa, titulo, legenda, link, local, categoria1, categoria2, categoria3, tipo, corpo, sessionId)

  //ejs.renderFile('views/template.ejs', { nome, email }, (err, html) => {
    //fs.writeFile('public/template.html', html, (err) => {
      //res.redirect('/template.html');
    //});
  //});
};
