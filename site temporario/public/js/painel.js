const corpo=[];

function addSubtitle (){
    let text= input_subtitulo.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<h3>${text}</h3>`;
        corpo.push(text);
    }
}
function addParagraph(){
    let text= input_paragrafo.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<p>${text}</p>`;
        corpo.push(text);
    }
}
function addImage(){
    let text= input_imagem.value;
    let text2= input_legendaImagem.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<img src="${text}" alt="${text2}">`;
        corpo.push(text);
    }
}
function addVideo(){
    let text= input_video.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<iframe src="${text}" frameborder="0" allowfullscreen></iframe>`;
        corpo.push(text);
    }
}
function generate(){
    let titulo = input_titulo.value;
    let tituloLink ='';
    let subtitulo = input_subtitulo.value;
    let paragrafo = input_paragrafo.value;
    let capa = input_capa.value;
    let legenda = legendaCapa.value;
    if(titulo=='' || subtitulo=='' || paragrafo=='' || capa==''){
        alert('Valor inválido');
    } else{
        tituloLink = linkdificador(titulo);
    }
}
function linkdificador(str) {
  return str
    .normalize('NFD')                     
    .replace(/[\u0300-\u036f]/g, '')      
    .replace(/[^\w\s-]/g, '')             
    .replace(/\s+/g, '-')                 
    .replace(/-+/g, '-')                  
    .replace(/^-+|-+$/g, '')              
    .toLowerCase();                       
}