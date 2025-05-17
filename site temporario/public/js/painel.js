const corpo=[];
const tipo=[]
function addSubtitle (){
    let text= input_subtitulo.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<h3>${text}</h3>`;
        corpo.push(text);
        tipo.push('Subtítulo');
        atualizar();
    }
    input_subtitulo.value = '';
}
function addParagraph(){
    let text= input_paragrafo.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<p>${text}</p>`;
        corpo.push(text);
        tipo.push('Paragráfo');
        atualizar();
    }
    input_paragrafo.value = '';
}
function addImage(){
    let text= input_imagem.value;
    let text2= input_legenda.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<img src="res/img/${text}" alt="${text2}">`;
        corpo.push(text);
        tipo.push('Imagem');
        atualizar();
    }
    input_imagem.value = '';
    input_legenda.value = '';
}
function addVideo(){
    let text= input_video.value;
    if(text==''){
        alert('Valor inválido');
    } else{
        text = `<iframe src="${text}" frameborder="0" allowfullscreen></iframe>`;
        corpo.push(text);
        tipo.push('Vídeo');
        atualizar();
    }
    input_video.value = '';
}
function generate(){
    let titulo = input_titulo.value;
    let tituloLink ='';
    let subtitulo = input_subtitulo.value;
    let paragrafo = input_paragrafo.value;
    let capa = input_capa.value;
    let legenda = input_legendaCapa.value;
    if(titulo=='' || subtitulo=='' || paragrafo=='' || capa==''){
        alert('Preencha todos os campos obrigatórios');
        return;
    } 
    tituloLink = linkdificador(titulo);
    
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
function atualizar(){
    div_corpo.innerHTML = '';
    div_corpo.innerHTML += `<div class="topicos"><button class="desativado">•Menu</button></div>
                            <div class="topicos"><button class="desativado">•Título</button></div>
                            <div class="topicos"><button class="desativado">•Capa</button></div>
                            <div class="topicos"><button class="desativado">•Autor</button></div>`;
    for (let i=0; i<tipo.length; i++){
        div_corpo.innerHTML += `<div class="topicos">
                                    <button class="ativo" onclick="excluir(${i})"> 
                                        <span class="texto-normal">•${tipo[i]}</span>
                                        <span class="texto-apagar">Excluir</span>
                                    </button>
                                </div>`;
    }
    div_corpo.innerHTML += `<div class="topicos"><button class="desativado">•Rodapé</button></div>`;
};
function excluir(i){
    corpo.splice(i, 1);
    tipo.splice(i, 1);
    atualizar();
}