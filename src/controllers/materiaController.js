const fs = require('fs');
const ejs = require('ejs');

exports.mostrarMateria = (req, res) => {
  res.sendFile('public/index.html', { root: '.' });
};

exports.criarMateria = (req, res) => {
  const { capa, titulo, legenda, link, local, categoria1, categoria2, categoria3, tipo, corpo, id } = req.body;
  console.log(capa, titulo, legenda, link, local, categoria1, categoria2, categoria3, tipo, corpo, id)
  if (tipo && !Array.isArray(tipo)) tipo = [tipo];
  if (corpo && !Array.isArray(corpo)) corpo = [corpo];
  let text=''
  for (let i=0; i<corpo.length; i++){
    if (tipo[i]=='Subtítulo'){
      text+=`<h3> ${corpo[i]} </h3>`
    } else if (tipo[i]=='Paragráfo'){
      text+=`<p> ${corpo[i]} </p>`
    } else if (tipo[i]=='Vídeo'){
      text += `<iframe src="${corpo[i]}" frameborder="0" allowfullscreen></iframe>`;
    } else if (tipo[i]=='Imagem' && tipo[i+1]=='Legenda'){
      text += `<img src="res/img/${corpo[i]}" alt="${corpo[i+1]}">`;
      i++
    } else if (tipo[i]=='Imagem'){
      text += `<img src="res/img/${corpo[i]}">`;
    }
  }
  console.log(text)
  //ejs.renderFile('views/template.ejs', { nome, email }, (err, html) => {
    //fs.writeFile('public/template.html', html, (err) => {
      //res.redirect('/template.html');
    //});
  //});
};
