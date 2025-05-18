const slides = ['slide1', 'slide2', 'slide3'];
let atual = 0;
let intervalo = setInterval(proximoSlide, 7000);

function mostrarSlide(indice) {
  document.getElementById(slides[indice]).checked = true;
  atual = indice;
}

function proximoSlide() {
  atual = (atual + 1) % slides.length;
  mostrarSlide(atual);
}

function anteriorSlide() {
  atual = (atual - 1 + slides.length) % slides.length;
  mostrarSlide(atual);
}

function proximo() {
  proximoSlide();
  reiniciarIntervalo();
};
function anterior() {
  anteriorSlide();
  reiniciarIntervalo();
};

function reiniciarIntervalo() {
  clearInterval(intervalo);
  intervalo = setInterval(proximoSlide, 7000);
}